extends AnimatedSprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	self.connect('body_entered', self, '_on_body_entered')
	pass
	
func _on_body_entered( body ):
	body.Health.take_damage(-10)
	get_parent().remove_child(self)
	print("ok")
	

func _process(delta):
	var collider = collision_info.collider
	if body.is_in_group('player'):
		emit_signal("body_entered")
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	pass
