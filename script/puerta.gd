class_name Puerta
extends Area2D

@export_file("*.tscn") var nivel_objetivo_path: String

func _on_body_entered(body: Node2D) -> void:
	assert(nivel_objetivo_path,"no se indico a que nivel ir.")
	if body is Player:
		GameGlobals.player_position = null
		await get_tree().process_frame
		get_tree().change_scene_to_file(nivel_objetivo_path)
