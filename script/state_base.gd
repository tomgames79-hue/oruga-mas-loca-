extends Node
class_name StateBase

@export var nombre : String
@onready var controlled_node: Node = self.owner

var state_machine:StateMachine

func start():
	pass


func end():
	pass
