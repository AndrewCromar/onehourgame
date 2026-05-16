extends Node2D

@export var bullet_scene : PackedScene

var FIRE_RATE : float = 0.5

var counter : float = 0.0

func _process(delta) -> void:
	look_at(get_global_mouse_position())
	
	counter -= delta
	if counter <= 0:
		counter = FIRE_RATE
		_shoot()

func _shoot() -> void:
	var bullet = bullet_scene.instantiate()
	bullet.position = position + Vector2.RIGHT.rotated(rotation) * 37
	bullet.rotation = rotation
	get_parent().add_child(bullet)
