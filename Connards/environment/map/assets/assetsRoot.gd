extends Node

var used_cells = (preload("res://environment/map/Sol1.tscn").instance()).get_used_cells()
var taille = sqrt(used_cells.size())
var y1 = 0
var y2
var obj

func _ready():
	while (y1<taille*5-5):
		if (y1<(taille*5-5)/2):
			spawn(preload("res://environment/map/assets/split/vege_10.tscn").instance(),10)
		else:
			spawn(preload("res://environment/map/assets/split/vege_11.tscn").instance(),9)
		spawn(preload("res://environment/map/assets/split/vege_12.tscn").instance(),8)
		spawn(preload("res://environment/map/assets/split/vege_13.tscn").instance(),7)
		spawn(preload("res://environment/map/assets/split/vege_14.tscn").instance(),6)
		spawn(preload("res://environment/map/assets/split/vege_15.tscn").instance(),5)
		spawn(preload("res://environment/map/assets/split/vege_16.tscn").instance(),4)
		spawn(preload("res://environment/map/assets/split/vege_17.tscn").instance(),3)
		spawn(preload("res://environment/map/assets/split/vege_18.tscn").instance(),2)
		y1 = y1 + 0.01*8

	pass

func spawn(ressource,proba):
	randomize()
	if (rand_range(0,100)<=proba):
		obj = Sprite.new()
		randomize()
		y2 = rand_range(0,taille*5)
		obj = ressource
		obj.z_index = obj.z_index+1 
		add_child(obj)
		obj.global_translate(Vector2(y2*50-10,y1*50))