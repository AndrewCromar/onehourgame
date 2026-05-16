extends Node2D

const SPEED = 200

func _process(delta: float) -> void:
	position += Vector2.RIGHT.rotated(rotation) * SPEED * delta
