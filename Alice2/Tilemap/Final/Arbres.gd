extends Node


# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var taillem = 5
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	for i in range(randi()%(2*taillem*taillem)+4*taillem*taillem):
		spawn_abr()
	pass

func spawn_abr():
	abr = Sprite.new()
	abr = get_child(0)
	add_child(abr)
	abr.global_translate(Vector2(randi()%taille*taillem,randi()%taille*taillem))
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
