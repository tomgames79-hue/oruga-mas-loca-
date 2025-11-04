extends Player_state_base
class_name Player_gravity
var input_axis = Input.get_axis("left","right")

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func handle_gravity(delta):
	player.velocity.y += gravity * delta

func on_physic_process(delta):
	handle_gravity(delta)

func on_input(event): pass

func apply_friction(input_axis, delta):
	if input_axis == 0 and player.is_on_floor():
		player.velocity.x = move_toward(player.velocity.x, 0, player.friction * delta)

func handle_air_acceleration(input_axis, speed, delta):
	if input_axis != 0:
		player.velocity.x = move_toward(player.velocity.x, speed * input_axis, player.acceleration * delta)

func handle_acceleration(input_axis, speed, delta):
	if input_axis != 0:
		player.velocity.x = move_toward(player.velocity.x, speed * input_axis, player.acceleration * delta)
	else:
		player.velocity.x = 0
