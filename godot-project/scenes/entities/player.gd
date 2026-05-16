extends Node2D

@export_file("*.tscn") var game_over_scene : String

var health = 3
var score = 0

func take_damage(amount: int):
	health -= amount

	if health <= 0:
		die()

func add_score():
	score += 1

func get_score() -> int:
	return score

func die():
	get_tree().call_deferred("change_scene_to_file", game_over_scene)
