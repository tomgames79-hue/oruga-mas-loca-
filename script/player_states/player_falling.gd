extends Player_gravity

func start():
	player.anim.play("falling")

func on_physics_process(delta):
	
	player.velocity.x = Input.get_axis("left", "right") * speed 
	if player.is_on_floor():
		state_machine.change_to("idle")
	
