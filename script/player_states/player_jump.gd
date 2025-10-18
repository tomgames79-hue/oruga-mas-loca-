extends Player_gravity


func start():
	#player.play_animation(player.animations.jump)
	#player.velocity.x = Input.get_axis("left", "right") * speed 
	player.velocity.y = jump_speed

func on_physics_process(delta):
	player.velocity.x = Input.get_axis("left", "right") * speed 
	if player.velocity.y > 0:
		state_machine.change_to("player_falling")
	
	player.move_and_slide()
