extends CanvasLayer

const Heart_row_size = 8
const  Heart_offset = 20
@onready var player: Player = $"../Player"
@onready var h_box_container: HBoxContainer = $HBoxContainer
@export var lista_vida : Array[TextureRect]

func _ready() -> void:
	for i in player.health:
		var new_heart = Sprite2D.new()
		new_heart.texture = $Heart.texture
		$Heart.add_child(new_heart)


func actualizar_vida(health):
	for e in lista_vida:
		e.visible = false
	for i in range(0, health):
		lista_vida[i].visible = true 


#func _process(delta: float) -> void:
	#for Heart in $Heart.get_children():
		#var index = Heart.get_index()
		#var x = (index % Heart_row_size) * Heart_offset
		#var y = (index / Heart_row_size) * Heart_offset
		#Heart.position = Vector2(x,y)
		#
		#var last_heart = floor(player.health)
		#if index > last_heart:
			#Heart.frame = 0
		#if index == last_heart:
			#Heart.frame = (player.health - last_heart) * 5
		#if index < last_heart:
			#Heart.frame = 4
