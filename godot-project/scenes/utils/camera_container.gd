extends Node2D

const SHAKE_DISTANCE : float = 5
const SHAKE_DURATION : float = 0.1
const SHAKE_SMOOTHING : float = 30
const THRESHHOLD : float = 0.1

@onready var camera : Camera2D = %Camera

var timer : float

var target_position : Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timer -= delta
	
	if timer > 0:
		var distance = target_position.length() - camera.position.length()
		if distance <= THRESHHOLD:
			target_position.x = (randf() * (SHAKE_DISTANCE * 2)) - SHAKE_DISTANCE
			target_position.y = (randf() * (SHAKE_DISTANCE * 2)) - SHAKE_DISTANCE
	else:
		target_position = Vector2.ZERO
	
	camera.position = camera.position.lerp(target_position, SHAKE_SMOOTHING * delta)

func shake() -> void:
	timer = SHAKE_DURATION
