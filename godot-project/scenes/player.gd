extends Node2D

var health = 3

func take_damage(amount: int):
	health -= amount
	print("Health left: ", health)
	
	if health <= 0:
		die()

func die():
	print("Game Over!")
	get_tree().reload_current_scene()
