extends Node2D

@export_file("*.tscn") var game_over_scene : String

const max_health : float = 3
var health : float = max_health
var score : float = 0

func take_damage(amount: int):
	health -= amount

	if health <= 0:
		die()

func die():
	get_tree().call_deferred("change_scene_to_file", game_over_scene) # pass score?
