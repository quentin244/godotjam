extends Node

var obj
var child
var taillem = 4
var scenes = [(preload("res://Tilemap/Map1.tscn").instance()),(preload("res://Tilemap/Map2.tscn").instance()), (preload("res://Tilemap/Map3.tscn").instance()), (preload("res://Tilemap/Map4.tscn").instance())]
var coin = [(preload("res://Tilemap/MapNW.tscn").instance()),(preload("res://Tilemap/MapNE.tscn").instance()), (preload("res://Tilemap/MapSudWest.tscn").instance()), (preload("res://Tilemap/MapSudEst.tscn").instance())]
var bordsup = [(preload("res://Tilemap/MapNord.tscn").instance()),(preload("res://Tilemap/MapNord.tscn").instance())]
var bordinf = [(preload("res://Tilemap/MapSud.tscn").instance()), (preload("res://Tilemap/MapSud.tscn").instance())]
var bordG = [(preload("res://Tilemap/Map1.tscn").instance()), (preload("res://Tilemap/MapWest.tscn").instance())]
var bordD = [(preload("res://Tilemap/Map2.tscn").instance()), (preload("res://Tilemap/MapEst.tscn").instance())]
var used_cells = (preload("res://Tilemap/Map1.tscn").instance()).get_child(0).get_used_cells()
var y1 = 0
var counter = 0

func _ready():
	add_child(preload("res://Tilemap/World.tscn").instance())
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
	
