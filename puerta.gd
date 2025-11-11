class_name Puerta
extends Area2D

@export_file("*.tscn") var nivel_objetivo_path: String

@export var nivel_global := GameGlobals.LEVEL_2


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		GameGlobals.player_position = null
		get_tree().change_scene_to_packed(nivel_global)
