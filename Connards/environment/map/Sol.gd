extends TileMap

func _notification(what):
	if what == NOTIFICATION_PARENTED:
		prints("Now",get_name(), "is a child of", get_parent().get_name())