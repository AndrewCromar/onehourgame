extends Sprite2D

var player : Area2D

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")

func _process(_delta: float) -> void:
	if player.health <= 0: pass
	modulate.a = 1 - (player.health / player.max_health)
