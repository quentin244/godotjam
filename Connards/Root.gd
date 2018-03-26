extends Node

var obj
var child
var taillem = 4
var scenes = [(preload("res://environment/map/Sol1.tscn").instance()),(preload("res://environment/map/Sol2.tscn").instance()), (preload("res://environment/map/Sol3.tscn").instance()), (preload("res://environment/map/Sol4.tscn").instance())]
var coin = [(preload("res://environment/map/Sol5.tscn").instance()),(preload("res://environment/map/Sol6.tscn").instance()), (preload("res://environment/map/Sol7.tscn").instance()), (preload("res://environment/map/Sol8.tscn").instance())]
var bordsup = [(preload("res://environment/map/Sol9.tscn").instance()),(preload("res://environment/map/Sol1.tscn").instance())]
var bordinf = [(preload("res://environment/map/Sol2.tscn").instance()), (preload("res://environment/map/Sol3.tscn").instance())]
var bordG = [(preload("res://environment/map/Sol4.tscn").instance()), (preload("res://environment/map/Sol5.tscn").instance())]
var bordD = [(preload("res://environment/map/Sol6.tscn").instance()), (preload("res://environment/map/Sol7.tscn").instance())]
var used_cells = (preload("res://environment/map/Sol8.tscn").instance()).get_used_cells()
var y1 = 0
var counter = 0

func _ready():
	add_child(preload("res://environment/map/assets/assetsRoot.tscn").instance())
	counter = 0
	ajout(0,0,0,coin)
	for i in range(1,taillem-1):
		ajout(i-1,i,0,bordsup)
	ajout(1,taillem-1,0,coin)
	for x in range(1,taillem-1):
		ajout(x-1,0,x,bordG)
		for y in range(1,taillem-1):
			ajout(counter,y,x,scenes)
			counter = counter + 1
		ajout(x-1,taillem-1,x,bordD)
	ajout(2,0,taillem-1,coin)
	for i in range(1,taillem-1):
		ajout(i-1,i,taillem-1,bordinf)
	ajout(3,taillem-1,taillem-1,coin)
	pass
	
func ajout(i,x,y,tab):
	child = Node2D.new()
	child = tab[i]
	add_child(child)
	child.global_translate(child.get_child(0).map_to_world(Vector2(sqrt(used_cells.size()),sqrt(used_cells.size())))*(Vector2(x,y)))
	
