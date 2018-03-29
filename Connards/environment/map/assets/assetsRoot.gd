extends Node

var taille = 8
var y = 0
var x = 0
var obj
#var splitvege = [(preload("res://environment/map/assets/split/vege/vege_1.tscn").instance()),(preload("res://environment/map/assets/split/vege/vege_11.tscn").instance()),(preload("res://environment/map/assets/split/vege/vege_13.tscn").instance()),(preload("res://environment/map/assets/split/vege/vege_15.tscn").instance()),(preload("res://environment/map/assets/split/vege/vege_17.tscn").instance()),(preload("res://environment/map/assets/split/vege/vege_19.tscn").instance()),(preload("res://environment/map/assets/split/vege/vege_20.tscn").instance()),(preload("res://environment/map/assets/split/vege/vege_4.tscn").instance()),(preload("res://environment/map/assets/split/vege/vege_10.tscn").instance()),(preload("res://environment/map/assets/split/vege/vege_12.tscn").instance()),(preload("res://environment/map/assets/split/vege/vege_14.tscn").instance()),(preload("res://environment/map/assets/split/vege/vege_16.tscn").instance()),(preload("res://environment/map/assets/split/vege/vege_18.tscn").instance()),(preload("res://environment/map/assets/split/vege/vege_2.tscn").instance()),(preload("res://environment/map/assets/split/vege/vege_3.tscn").instance())]
#var splitvegeused=[]

func _ready():
#	choice()
	while (y<taille*5-10.5):
		if (y<(taille*5-5)/2):
#			spawn(splitvegeused[randi()%splitvegeused.size()+1-1],8)
			spawn2(preload("res://environment/map/assets/split/png/sapin8.tscn").instance(),7)
			spawn(preload("res://environment/map/assets/split/vege/vege_15.tscn").instance(),7)
			spawn(preload("res://environment/map/assets/split/vege/vege_11.tscn").instance(),7)
		else:
			spawn(preload("res://environment/map/assets/split/vege/vege_19.tscn").instance(),9)
			spawn(preload("res://environment/map/assets/split/vege/vege_18.tscn").instance(),6)
			spawn2(preload("res://environment/map/assets/split/png/souche_12.tscn").instance(),5)
		spawn(preload("res://environment/map/assets/split/vege/vege_20.tscn").instance(),10)
		spawn2(preload("res://environment/map/assets/split/png/buisson2.tscn").instance(),7)
		spawn2(preload("res://environment/map/assets/split/png/sapin1.tscn").instance(),4)
		spawn(preload("res://environment/map/assets/split/vege/vege_1.tscn").instance(),2)
		spawn2(preload("res://environment/map/assets/split/png/groche_1.tscn").instance(),2)
		y = y + 0.01*8
	pass

#func choice():
#	for i in range(0,9):
#		var rng = randi()%splitvege.size()+1-1
#		splitvegeused.append(splitvege[rng])
#		splitvege.erase(splitvege[rng])

func spawn(ressource,proba):
	randomize()
	if (rand_range(0,100)<=proba):
		obj = Sprite.new()
		randomize()
		x = rand_range(0,taille*3+5)
		obj = ressource
		obj.z_index = obj.z_index+1 
		obj.set_name(str(randi()%999999+10))
		add_child(obj)
		obj.global_translate(Vector2(x*50+555,y*50+512))
		
func spawn2(ressource,proba):
	randomize()
	if (rand_range(0,100)<=proba):
		obj = Sprite.new()
		randomize()
		x = rand_range(0,taille*3+5)
		obj = ressource
		obj.z_index = obj.z_index+2
		obj.set_name(str(randi()%999999+10))
		add_child(obj)
		obj.global_translate(Vector2(x*50+555,y*50+512))