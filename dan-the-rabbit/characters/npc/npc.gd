extends "res://characters/character.gd"

export(int) var patrol_distance = 200
var start_position = Vector2()
var end_position = Vector2()

var last_patrol_direction = Vector2(-1, 0)

enum STATES_MIND { MIND_WAIT, MIND_MOVE, MIND_ACT }
var mind_state = null
var previous_mind_state = null


func _ready():
	$Wesh.hide()
	#$Health.free()
	$WeaponPivot.free()
	$Timer.connect('timeout', self, '_on_WaitTimer_timeout')

	# Disabling collisions
	$CollisionShape2D.disabled = false

	max_speed = 240
	start_position = position
	end_position = start_position + Vector2(patrol_distance, 0)

	_change_mind_state(MIND_WAIT)

	randomize()
	$Timer.wait_time = randf() * 2
	$Timer.start()


func _physics_process(delta):
	if not mind_state == MIND_MOVE:
		return
	input_direction.x = -last_patrol_direction.x
	if input_direction.x == 1 and position.x > end_position.x \
		or input_direction.x == -1 and position.x < start_position.x:
		last_patrol_direction = input_direction
		_change_mind_state(MIND_WAIT)


func _change_mind_state(new_state):
	match new_state:
		MIND_WAIT:
			input_direction = Vector2()
			$Timer.wait_time = 1.0
			$Timer.start()

			_change_state(IDLE)
		MIND_MOVE:
			$Timer.stop()

			_change_state(MOVE)
	mind_state = new_state


func _on_WaitTimer_timeout():
	_change_mind_state(MIND_MOVE)


func _on_Area2D_body_entered( body ):
	if not body.is_in_group('character'):
		return
	$Wesh.show()
	print("dong")

func _on_Area2D_body_exited( body ):
	if not body.is_in_group('character'):
			return
	$Wesh.hide()
	print("ding")
