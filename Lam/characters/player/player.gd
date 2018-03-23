extends "res://characters/character.gd"


func _input(event):
	if event.is_action_pressed("attack") and not state in [ATTACK, JUMP]:
		_change_state(ATTACK)
	elif event.is_action_pressed("throw"):
		$PebbleSpawner.spawn_pebble()
	elif event.is_action_pressed("jump"):
		if not state in [IDLE, MOVE]:
			return
		_change_state(JUMP)


func _physics_process(delta):
	input_direction = Vector2()
	input_direction.x = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	input_direction.y = int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up"))

	if input_direction and input_direction != last_move_direction:
		$PebbleSpawner.update_position(input_direction)
		emit_signal('direction_changed', input_direction)

	if Input.is_action_pressed("run"):
		max_speed = MAX_RUN_SPEED
	else:
		max_speed = MAX_WALK_SPEED