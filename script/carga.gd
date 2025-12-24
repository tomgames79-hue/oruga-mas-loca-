extends Node2D

@export_file("*.tscn") var nivel_objetivo_path: String

func _ready() -> void:
	$Timer.start(randf_range(1 , 4))

func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://escenas/levels/level_1.tscn")
