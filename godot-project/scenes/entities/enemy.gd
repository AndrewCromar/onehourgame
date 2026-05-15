extends Area2D

const SPEED = 100

func _ready() -> void:
	area_entered.connect(_on_area_entered)

func _process(delta: float) -> void:
	position = position.move_toward(Vector2.ZERO, SPEED * delta)

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("shield"):
		queue_free()
	elif area.is_in_group("player"):
		area.take_damage(1)
		queue_free()
