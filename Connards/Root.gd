extends Node

var obj
var child
var taillem = 3
var scenes = [(preload("res://environment/map/Sol1.tscn").instance()),(preload("res://environment/map/Sol2.tscn").instance()), (preload("res://environment/map/Sol3.tscn").instance()), (preload("res://environment/map/Sol4.tscn").instance()), (preload("res://environment/map/Sol5.tscn").instance()), (preload("res://environment/map/Sol6.tscn").instance()), (preload("res://environment/map/Sol7.tscn").instance()), (preload("res://environment/map/Sol8.tscn").instance())]
var used_cells = (preload("res://environment/map/Sol9.tscn").instance()).get_used_cells()
var y1 = 0
var counter = 0

func _ready():
	add_child(preload("res://environment/map/assets/assetsRoot.tscn").instance())
	counter = 0
	ajout(0,0,scenes)
	for i in range(1,taillem):
		ajout(i,0,scenes)
	ajout(taillem,0,scenes)
	for x in range(1,taillem):
		ajout(0,x,scenes)
		for y in range(1,taillem):
			ajout(y,x,scenes)
			counter = counter + 1
		ajout(taillem,x,scenes)
	ajout(0,taillem,scenes)
	for i in range(1,taillem):
		ajout(i,taillem,scenes)
	ajout(taillem,taillem,scenes)
	pass
	
func ajout(x,y,tab):
	child = Node2D.new()
	child = tab[randi()%7+1]
	add_child(child)
	child.global_translate(child.map_to_world(Vector2(sqrt(used_cells.size()),sqrt(used_cells.size())))*(Vector2(x,y)))
	
