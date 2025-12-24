extends Node

@onready var opciones: Panel = $Opciones



func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pausa"):
		get_tree().paused = !get_tree().paused
		opciones.visible = true


func _ready() -> void:
	opciones.visible = false


func _on_back_pressed() -> void:
	opciones.visible = false
	get_tree().paused = false
