extends Player_gravity

func start():
	player.play_animation(player.animations.walk)

func on_physic_process(delta):
	#controlled_node.play_animation(controlled_node.animtion.walk)
	player.velocity.x = Input.get_axis("left","right") * speed 

func on_input(event):
	if Input.is_action_just_pressed("jump") and player.is_on_floor():
		state_machine.change_to("player_jump")
	elif Input.is_action_just_pressed("attack"):
		state_machine.change_to("player_attack")
	elif not (Input.is_action_pressed("left") or Input.is_action_pressed("right")):
		state_machine.change_to("player_idle")
