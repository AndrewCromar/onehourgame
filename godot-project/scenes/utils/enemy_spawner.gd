extends Node2D

@export var enemy_scene : PackedScene

const SPAWN_RATE : float = 1.0

const SPWAN_RADIUS : float = 600

var counter : float = 0

func _process(delta: float) -> void:
	counter -= delta
	if counter <= 0:
		counter = SPAWN_RATE
		_spawn_enemy()

func _spawn_enemy() -> void:
	var angle = randf() * TAU
	var point = Vector2(cos(angle), sin(angle)) * SPWAN_RADIUS
	
	var enemy = enemy_scene.instantiate()
	enemy.position = point
	add_child(enemy)
