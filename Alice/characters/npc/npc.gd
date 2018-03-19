extends "res://characters/character.gd"

export(int) var patrol_distance = 200
var start_position = Vector2()
var end_position = Vector2()
var play
var last_patrol_direction = Vector2(-1, 0)
var jinput_direction
enum STATES_MIND { MIND_WAIT, MIND_MOVE, MIND_ACT }
var mind_state = null
var previous_mind_state = null
var ctrl
var sh
var script 
func _ready():
	#$Health.free()
	$WeaponPivot.free()
	$Timer.connect('timeout', self, '_on_WaitTimer_timeout')

	# Disabling collisions
	$CollisionShape2D.disabled = false

	max_speed = 300
	start_position = position
	end_position = start_position + Vector2(patrol_distance, 0)

	_change_mind_state(MIND_WAIT)

	randomize()
	$Timer.wait_time = randf() * 2
	$Timer.start()


func _physics_process(delta):
	play = get_tree().get_root().get_node("Level").find_node("Player",true,true).global_position
	var self_gtrans = self.get_global_transform()
	var p_local = self_gtrans.xform_inv(play)
	#print(last_move_direction)
	#print(input_direction)
	#print(local_position)
	#jinput_direction = Vector2()
	#jinput_direction.x = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	#jinput_direction.y = int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up"))
	#input_direction = Vector2()
	#print(last_move_direction)
	if (p_local.x < input_direction.x):
		input_direction.x = last_move_direction.x - 5
	else:
		input_direction.x = last_move_direction.x + 5
	if (p_local.y < input_direction.y):
		input_direction.y = last_move_direction.y - 5
	else:
		input_direction.y = last_move_direction.y + 5
	#last_patrol_direction = input_direction
	#_change_mind_state(MIND_WAIT)
	#if input_direction and input_direction != last_move_direction:
	#	$BodyPivot.move_local_x(input_direction.x)
	#	$BodyPivot.move_local_y(input_direction.y)
	#	emit_signal('direction_changed', input_direction)
	#print (input_direction)
	#print (jinput_direction)
	
	
func _change_mind_state(new_state):
	match new_state:
		MIND_WAIT:
			ctrl = true
			input_direction = Vector2()
			$Timer.wait_time = 1.0
			$Timer.start()

			_change_state(IDLE)
		MIND_MOVE:
			if ctrl == true:
				$BodyPivot/gtfo.set_flip_h(!$BodyPivot/gtfo.flip_h)
				ctrl = false
			$Timer.stop()

			_change_state(MOVE)
	mind_state = new_state

func _on_WaitTimer_timeout():
	_change_mind_state(MIND_MOVE)

func _on_Area2D_body_entered( body ):
	if not body.is_in_group('player'):
		return
	#$Wesh.show()
	$BodyPivot/gtfo.show()
	print("dong")

func _on_Area2D_body_exited( body ):
	if not body.is_in_group('player'):
			return
	#$Wesh.hide()
	$BodyPivot/gtfo.hide()
	print("ding")