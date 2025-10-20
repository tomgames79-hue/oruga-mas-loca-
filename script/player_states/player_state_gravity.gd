extends Player_state_base
class_name Player_gravity

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func handle_gravity(delta):
	player.velocity.y += gravity * delta

func on_physic_process(delta):
	handle_gravity(delta)

func on_input(event): pass
