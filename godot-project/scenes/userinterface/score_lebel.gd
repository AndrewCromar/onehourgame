extends Label

var player : Area2D

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")


func _process(_delta: float) -> void:
	text = str(player.get_score())
