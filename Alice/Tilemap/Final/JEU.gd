extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var abr
var chill
var taillem = 5
var scenes = []
var coin = []
var bordsup = []
var bordinf = []
var bordg = []
var bordd = []
var used_cells = (preload("res://Lunch.tscn").instance()).get_child(0).get_used_cells()
var taille = sqrt(used_cells.size())
var y1 = 0
var y2
var abe = []
var c
var r
var acc = 0
var spa
func _ready():
	var ra = randi()%(2*taillem*taillem)+1*taillem*taillem
	var vpos
	#for i in range(taille*taillem):
	abe.append(preload("res://Tilemap/Final/World.tscn").instance())
		#spawn()
	spa = Node.new()
	spa = abe[0]
	add_child(spa)
		#if (rand_range(1,2)==1):
		#spawn_foret(vpos)
	acc = 0
	ajout(0,0,0,coin)
	for i in range(1,taillem-1):
		ajout(i-1,i,0,bordsup)
	ajout(1,taillem-1,0,coin)
	for x in range(1,taillem-1):
		ajout(x-1,0,x,bordg)
		for y in range(1,taillem-1):
			ajout(acc,y,x,scenes)
			acc = acc + 1
		ajout(x-1,taillem-1,x,bordd)
	ajout(2,0,taillem-1,coin)
	for i in range(1,taillem-1):
		ajout(i-1,i,taillem-1,bordinf)
	ajout(3,taillem-1,taillem-1,coin)
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	pass
	
func spawn():
	abr = Node2D.new()
	y1 = y1 + 0.33
	randomize()
	y2 = rand_range(0,taille*taillem)
	abr = abe[acc]
	acc = acc + 1
	abr.z_index = abr.z_index+1
	add_child(abr)
	abr.global_translate(Vector2(y2*50,y1*50))
	#return (Vector2(y2*64,y1*64))
	
func spawn_foret(x):
	r = 1
	randomize()
	for i in range(rand_range(15,30)):
		#abe.append(preload("res://World.tscn").instance())
		c = Node2D.new()
		c = abe[i]
		add_child(c)
		randomize()
		c.z_index = c.z_index+1
		r = r + randi()
		randomize()
		c.global_translate(Vector2(randi()/100,r/100)+x)
	
func ajout(i,x,y,tab):
	tab.append(preload("res://Lunch.tscn").instance())
	chill = Node2D.new()
	chill = tab[i]
	add_child(chill)
	chill.global_translate(chill.get_child(0).map_to_world(Vector2(taille,taille))*(Vector2(x,y)))
	
