extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var chill
var taillem = 5
var scenes = [preload("res://essai.tscn").instance(),preload("res://essai.tscn").instance(),preload("res://essai.tscn").instance(),preload("res://essai.tscn").instance()]
var coin = [preload("res://essai.tscn").instance(),preload("res://essai.tscn").instance(),preload("res://essai.tscn").instance(),preload("res://essai.tscn").instance()]
var bordsup = [preload("res://essai.tscn").instance(),preload("res://essai.tscn").instance(),preload("res://essai.tscn").instance(),preload("res://essai.tscn").instance()]
var bordinf = [preload("res://essai.tscn").instance(),preload("res://essai.tscn").instance(),preload("res://essai.tscn").instance(),preload("res://essai.tscn").instance()]
var bordg = [preload("res://essai.tscn").instance(),preload("res://essai.tscn").instance(),preload("res://essai.tscn").instance(),preload("res://essai.tscn").instance()]
var bordd = [preload("res://essai.tscn").instance(),preload("res://essai.tscn").instance(),preload("res://essai.tscn").instance(),preload("res://essai.tscn").instance()]
var used_cells = scenes[1].get_child(0).get_used_cells()
var taille = sqrt(used_cells.size())
func _ready():
	ajout(0,0,0,coin)
	for i in range(taillem-1):
		ajout(randi()%bordsup.size()-1,i,0,bordsup)
	ajout(1,taillem-1,0,coin)
	for x in range(taillem-1):
		ajout(randi()%bordg.size()-1,0,x,bordg)
		for y in range(taillem-1):
			ajout(randi()%scenes.size()-1,y,x,scenes)
		ajout(randi()%bordd.size()-1,taillem-1,x,bordd)	
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	pass
	
func ajout(i,x,y,tab):
	chill = Node2D.new()
	chill = tab[i]
	add_child(chill)
	chill.global_translate(chill.get_child(0).map_to_world(Vector2(taille,taille))*(Vector2(x,y)))
	
func haut():
	ajout(0,0,0,coin)
	for i in range(taillem-2):
		ajout(randi()%bordsup.size()-1,0,i,bordsup)
	ajout(1,0,taillem-1,coin)
	
func milieu():
	for x in range(taillem-2):
		ajout(randi()%bordg.size()-1,x,0,bordg)
		for y in range(taillem-2):
			ajout(randi()%scenes.size()-1,x,y,scenes)
		ajout(randi()%bordd.size()-1,x,taillem-1,bordd)
	
func bas():
	ajout(2,taillem-1,0,coin)
	for i in range(taillem-2):
			ajout(randi()%bordinf.size()-1,taillem-1,i,bordinf)
	ajout(3,taillem-1,taillem-1,coin)