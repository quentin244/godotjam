extends Node

var child
var taillem = 4
var scenes = [(preload("res://environment/map/Sol1.tscn").instance()),(preload("res://environment/map/Sol2.tscn").instance()), (preload("res://environment/map/Sol3.tscn").instance()), (preload("res://environment/map/Sol4.tscn").instance()), (preload("res://environment/map/Sol5.tscn").instance()), (preload("res://environment/map/Sol6.tscn").instance()), (preload("res://environment/map/Sol7.tscn").instance()), (preload("res://environment/map/Sol8.tscn").instance()), (preload("res://environment/map/Sol9.tscn").instance())]

func _ready():
	prints("init",scenes.size(),"scenes")
	add_child(preload("res://environment/map/assets/assetsRoot.tscn").instance())
	for x in range(1,taillem):
		for y in range(1,taillem):
			prints("coor :",x," ",y)
			ajout(x,y,scenes)
	pass
	prints("fin")
	
func ajout(x,y,tab):
	aff(scenes)
	child = Node2D.new()
	var rng = randi()%scenes.size()+1
	child = tab[rng-1]
	add_child(child)
	scenes.erase(child)
	child.translate(Vector2(512*x,512*y))

func aff(scn):
	for i in range(0,scenes.size()):
		prints(scn[i].get_name())