extends Node
class_name StateMachine

@onready var controlled_node: Node = self.owner

@export var default_state:StateBase
@export var state_label: Label

var current_state: StateBase = null

func _ready() -> void:
	call_deferred("state_default_start")

func state_default_start() -> void:
	current_state = default_state
	state_start()

func state_start() -> void:
	if is_instance_valid(state_label):
		state_label.text = current_state.name
	#prints("StateMachine", controlled_node.name, "Start state", current_state.name)
	current_state.controlled_node = controlled_node
	current_state.state_machine = self
	current_state.start()

func change_to(new_state:String) -> void:
	if current_state and current_state.has_method("end"): 
		current_state.end()
	current_state = get_node(new_state)
	state_start()


func _process(delta: float) -> void:
	if current_state and current_state.has_method("on_process"): 
		current_state.on_process(delta)
	
func _physics_process(delta: float) -> void:
	if current_state and current_state.has_method("on_physics_process"): 
		current_state.on_physics_process(delta)

func _input(event: InputEvent) -> void:
	if current_state and current_state.has_method("on_input"): 
		current_state.on_input(event)

func _unhandled_input(event: InputEvent) -> void:
	if current_state and current_state.has_method("on_unhandled_input"): 
		current_state.on_unhandled_input(event)


func _unhandled_key_input(event: InputEvent) -> void:
	if current_state and current_state.has_method("on_unhandled_key_input"): 
		current_state.on_unhandled_key_input(event)
