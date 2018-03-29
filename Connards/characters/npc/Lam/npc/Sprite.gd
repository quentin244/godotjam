extends Node2D

func dial():
	get_node("/root/Root/YSort/Player/Camera2D/dialoguebox/dialoguebox2")._print_dialogue("FALLYQ")
	get_node("/root/Root/YSort/Player/Camera2D/dialoguebox/dialoguebox2").show()
	
func closdial():
	get_node("/root/Root/YSort/Player/Camera2D/dialoguebox/dialoguebox2")._reset_dialogue()
	get_node("/root/Root/YSort/Player/Camera2D/dialoguebox/dialoguebox2").hide()

func _on_Area2D_body_entered( body ):
	if not body.is_in_group('player'):
		return
	dial()

func _on_Area2D_body_exited( body ):
	closdial()