extends Player_gravity


func on_physics_process(delta):
	player.velocity.x = Input.get_axis("left", "right") * speed 
	if is_zero_approx(player.velocity.y):
		state_machine.change_to("player_idle")
	
