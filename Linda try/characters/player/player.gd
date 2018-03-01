extends KinematicBody2D

signal hit

var SPEED = 500
var velocity = Vector2()
var screensize

func _ready():
	screensize = get_viewport_rect().size
	position = $StartPosition.position
	
			
func _process(delta):
	velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * SPEED
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
		
	position += velocity * delta
	position.x = clamp(position.x, 0, screensize.x)
	position.y = clamp(position.y, 0, screensize.y)
	
	if velocity.x >0:
		$AnimatedSprite.animation = "right"
		$AnimatedSprite.flip_v = false
	elif velocity.x < 0:
		$AnimatedSprite.animation = "left"
		$AnimatedSprite.flip_v = false
	elif velocity.y < 0:
		$AnimatedSprite.animation = "up"
	elif velocity.y > 0:
		$AnimatedSprite.animation = "down"