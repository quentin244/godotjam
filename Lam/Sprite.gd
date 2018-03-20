extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

		
func dial():
	#get_node("Camera2D2/dialoguebox/RichTextLabel").set_hidden(false)
	get_node("dialoguebox/dialoguebox")._print_dialogue("Hello World ")
	get_node("dialoguebox/dialoguebox").show()
	var point = get_node("/root/level/YSort/Player/Camera2D2/dialogue")
	
func closdial():
	get_node("dialoguebox/dialoguebox").hide()

func _on_Area2D_body_entered( body ):
	if not body.is_in_group('player'):
		return
	dial()

func _on_Area2D_body_exited( body ):
	closdial()

