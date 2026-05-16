extends Area2D

const SPEED = 100

@export var death_sounds : Array[AudioStream] = []
@onready var audio_player: AudioStreamPlayer = $AudioStreamPlayer

var player : Area2D

func _ready() -> void:
	area_entered.connect(_on_area_entered)
	player = get_tree().get_first_node_in_group("player")

func _process(delta: float) -> void:
	position = position.move_toward(Vector2.ZERO, SPEED * delta)

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("shield"):
		_die()
	
	elif area.is_in_group("bullet"):
		area.get_parent().queue_free()
		_die()
	
	elif area.is_in_group("player"):
		area.take_damage(1)
		queue_free()

func _die() -> void:
	Global.score += 1
	
	_spawn_particles()
	_play_random_death_sound()
	
	var camera = get_tree().root.find_child("CameraContainer", true, false)
	if camera:
		camera.shake()
	
	queue_free()

func _spawn_particles() -> void:
	var p = %Particles.duplicate()
	get_parent().add_child(p)
	p.global_position = global_position
	p.emitting = true

	await get_tree().create_timer(1.0).timeout
	p.queue_free()


func _play_random_death_sound() -> void:
	var random_index = randi() % death_sounds.size()
	audio_player.stream = death_sounds[random_index]
	
	audio_player.get_parent().remove_child(audio_player)
	get_tree().root.add_child(audio_player)

	audio_player.play()

	audio_player.finished.connect(audio_player.queue_free)
