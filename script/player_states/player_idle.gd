extends Player_gravity


func start():
	player.velocity.x = 0
	player.play_animation(player.animations.idle)

func on_physic_process(delta):
	player.move_and_slide()

func on_input(event):
	if Input.is_action_pressed("left") or Input.is_action_pressed("right"):
		state_machine.change_to("player_walk") 
	elif Input.is_action_just_pressed("jump"):
		state_machine.change_to("player_jump")
	elif Input.is_action_just_pressed("attack"):
		state_machine.change_to("player_attack")
