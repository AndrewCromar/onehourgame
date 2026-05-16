extends Node2D

func _process(_delta) -> void:
	var input_vector = Input.get_vector("left", "right", "up", "down")
	look_at(input_vector)
	#look_at(get_global_mouse_position())
