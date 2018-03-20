extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var acc = 0
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	if (acc < 300):
		apply_scale(Vector2(self.scale.x,self.scale.y))
		position.x = position.x + 2
	elif (acc>=300 && acc<600):
		apply_scale(Vector2(-self.scale.x,self.scale.y))
		position.x = position.x - 2
	else:
		acc = acc - 600
	acc = acc + 1
	print (acc)
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	#global_translate(self.global_position+Vector2(acc,0))
	pass
