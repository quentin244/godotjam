extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
		
func dial():
	get_node("/root/Level/YSort/Player/Camera2D2/dialoguebox/dialoguebox")._print_dialogue("Hello World ")
	get_node("/root/Level/YSort/Player/Camera2D2/dialoguebox/dialoguebox").show()
	
func closdial():
	get_node("/root/Level/YSort/Player/Camera2D2/dialoguebox/dialoguebox")._reset_dialogue()
	get_node("/root/Level/YSort/Player/Camera2D2/dialoguebox/dialoguebox").hide()

func _on_Area2D_body_entered( body ):
	if not body.is_in_group('player'):
		return
	dial()

func _on_Area2D_body_exited( body ):
	closdial()