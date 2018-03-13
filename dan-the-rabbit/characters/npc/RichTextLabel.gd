#Dialoguebox.gd
extends RichTextLabel
var dialog= ["Bonjour bienvenue sur le super jeu Lam the Lapin !!","Amusez vous bien!","t'es moche"]
var page=0

func _ready():
	set_bbcode(dialog[page])
	set_visible_characters(0)
	set_process_input(true)

func _input(event):
	if Input.is_action_pressed("dial"):
		if get_visible_characters() > get_total_character_count():
			if page < dialog.size()-1:
				page+=1
				set_bbcode(dialog[page])
				set_visible_characters(0)

func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)
	pass # replace with function body
