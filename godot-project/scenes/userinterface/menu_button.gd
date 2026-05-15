extends Button

@export_file("*.tscn") var menu_scene : String

func _ready() -> void:
	pressed.connect(_on_pressed)

func _on_pressed() -> void:
	get_tree().change_scene_to_file(menu_scene)
