extends Node
class_name StateMachine

@onready var controlled_node: Node = self.owner
@export var player : Player
@export var state_label: Label
@export var current_state: StateBase = null
@export var states : Array[StateBase] = []
var state_dic : Dictionary = {}


func _ready() -> void:
	for state in states:
		state.player = player
		state.state_machine = self
		state_dic[state.nombre] = state

#func state_start() -> void:
	#if is_instance_valid(state_label):
		#state_label.text = current_state.name
	##prints("StateMachine", controlled_node.name, "Start state", current_state.name)
	#current_state.controlled_node = controlled_node
	#current_state.state_machine = self
	#current_state.start()

func change_to(new_state:String) -> void:
	current_state.end()
	print(new_state)
	current_state = state_dic[new_state]
	current_state.start()


func kk_process(delta: float) -> void:
	if current_state and current_state.has_method("on_process"): 
		current_state.on_process(delta)
	
func kk_physics_process(delta: float) -> void:
	if current_state and current_state.has_method("on_physics_process"): 
		current_state.on_physics_process(delta)

func kk_input(event: InputEvent) -> void:
	if current_state and current_state.has_method("on_input"): 
		current_state.on_input(event)

func kk_unhandled_input(event: InputEvent) -> void:
	if current_state and current_state.has_method("on_unhandled_input"): 
		current_state.on_unhandled_input(event)


func kk_unhandled_key_input(event: InputEvent) -> void:
	if current_state and current_state.has_method("on_unhandled_key_input"): 
		current_state.on_unhandled_key_input(event)
