extends Area2D
@onready var exclamation_mark: Sprite2D = $ExclamationMark
const NOTA_3 = preload("res://dialogues/nota 3.dialogue")


var is_player_close = false
var is_dialogue_active = false 


func _ready(): 
	DialogueManager.dialogue_started.connect(_on_dialogue_started)
	DialogueManager.dialogue_ended.connect(_on_dialogue_ended)


func _process(_delta: float):
	if is_player_close and Input.is_action_just_pressed("interactuar"):
		DialogueManager.show_dialogue_balloon(NOTA_3 , "start")




func _on_area_entered(area: Area2D):
	exclamation_mark.visible = true
	is_player_close = true

func _on_area_exited(area: Area2D):
	exclamation_mark.visible = false
	is_player_close = false
	
func _on_dialogue_started(resource: DialogueResource):
	is_dialogue_active = true 

func _on_dialogue_ended(resource: DialogueResource):
	is_dialogue_active = false
