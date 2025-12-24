extends Control

@onready var main_buttons: VBoxContainer = $MainButtons
@onready var opciones: Panel = $Opciones



func _ready() -> void:
	main_buttons.visible = true
	opciones.visible = false


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://escenas/carga.tscn")


func _on_options_pressed() -> void:
	main_buttons.visible = false
	opciones.visible = true



func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://escenas/creditos.tscn")


func _on_back_pressed() -> void:
	_ready()


func _on_audio_pressed() -> void:
	main_buttons.visible = false
	opciones.visible = false



func _on_audio_back_pressed() -> void:
	opciones.visible = true



func _on_video_pressed() -> void:
	opciones.visible = false



func _on_video_back_pressed() -> void:
	opciones.visible = true
