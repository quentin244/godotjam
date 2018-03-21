extends NinePatchRect

var printing= false
var timer = 0
var textToPrint =""
var currentChar =0
const SPEED=0.1

func _ready():
	set_physics_process(true)
	pass

func _physics_process(delta):
	if printing:
		timer += delta
		if timer > SPEED:
			timer =0
			get_node("RichTextLabel").set_bbcode(get_node("RichTextLabel").get_bbcode() +  textToPrint[currentChar])
			currentChar +=1
		if currentChar >= textToPrint.length():
			currentChar=0
			textToPrint=""
			timer =0	

func _print_dialogue(text):
	printing =true
	textToPrint=text
	
func _reset_dialogue():
	get_node("RichTextLabel").set_bbcode("")