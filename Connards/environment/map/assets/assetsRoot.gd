extends Node

var taille = 8
var x = 0
var y = 0
var obj

func _ready():
	prints("taille :",taille)
	while (y<taille*5-5):
		if (y<(taille*5-5)/2):
			spawn(preload("res://environment/map/assets/split/vege_10.tscn").instance(),10)
			spawn(preload("res://environment/map/assets/split/vege_12.tscn").instance(),8)
			spawn(preload("res://environment/map/assets/split/vege_13.tscn").instance(),7)
		else:
			spawn(preload("res://environment/map/assets/split/vege_11.tscn").instance(),9)
			spawn(preload("res://environment/map/assets/split/vege_14.tscn").instance(),6)
			spawn(preload("res://environment/map/assets/split/vege_15.tscn").instance(),5)
		spawn(preload("res://environment/map/assets/split/vege_16.tscn").instance(),4)
		spawn(preload("res://environment/map/assets/split/vege_18.tscn").instance(),2)
	pass

func spawn(ressource,proba):
	randomize()
	if (rand_range(0,10)<=proba):
		obj = Sprite.new()
		randomize()
		x = rand_range(512,taille*128)
		y = rand_range(512,taille*128)
		obj = ressource
		obj.z_index = obj.z_index+1 
		add_child(obj)
		obj.translate(Vector2(x,y))