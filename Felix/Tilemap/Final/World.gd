extends Node

var used_cells = (preload("res://Lunch.tscn").instance()).get_child(0).get_used_cells()
var taille = sqrt(used_cells.size())
var y1 = 0
var y2
var obj

func _ready():
	while (y1<taille*5-5):
		if (y1<(taille*5-5)/2):
			spawn(preload("res://arbre1.tscn").instance(),100)
		else:
			spawn(preload("res://arbre1.tscn").instance(),10)
		spawn(preload("res://arbre1of.tscn").instance(),0)
		spawn(preload("res://autonne1.tscn").instance(),0)
		spawn(preload("res://autonne2.tscn").instance(),0)
		spawn(preload("res://groche_2.tscn").instance(),0)
		spawn(preload("res://groche_4.tscn").instance(),0)
		spawn(preload("res://groche_4.tscn").instance(),0)
		spawn(preload("res://groche_1.tscn").instance(),0)
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