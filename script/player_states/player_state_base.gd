extends StateBase
class_name Player_state_base

@export var speed : float
@export var jump_speed : float

var player:Player:
	set (value):
		controlled_node = value
	get:
		return controlled_node
