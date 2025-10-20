extends Player_gravity

func start():
	player.velocity.x = 0
	player.anim.play("idle")

func on_physic_process(delta):
	super(delta)
	if Input.get_axis("left", "right") != 0:
		state_machine.change_to("walk")

func on_input(event):
	if event.is_action_pressed("jump") and player.is_on_floor():
		state_machine.change_to("jump")
	if event.is_action_pressed("attack"):
		state_machine.change_to("attack")
	#if Input.is_action_pressed("left") or Input.is_action_pressed("right"):
		#state_machine.change_to("player_walk") 
	#elif Input.is_action_just_pressed("jump"):
		#state_machine.change_to("player_jump")
	#elif Input.is_action_just_pressed("attack"):
		#state_machine.change_to("player_attack")
