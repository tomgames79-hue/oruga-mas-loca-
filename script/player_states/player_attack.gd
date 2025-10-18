extends Player_gravity

func start():
	await player.play_animation(player.animations.attack)
	state_machine.change_to("player_idle")


func on_input(event):
	if Input.is_action_pressed("left") or Input.is_action_pressed("right"):
		state_machine.change_to("player_walk") 
	elif Input.is_action_just_pressed("jump"):
		state_machine.change_to("player_jump")
