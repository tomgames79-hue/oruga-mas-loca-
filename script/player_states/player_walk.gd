extends Player_gravity

func start():
	player.anim.play("walk")

func on_physic_process(delta):
	super(delta)
	var dir = Input.get_axis("left", "right")
	if dir == 0:
		state_machine.change_to("idle")
	#player.velocity.x = dir * speed
	handle_acceleration(dir,speed, delta)
	apply_friction(dir, delta)
	


func on_input(event):
	if event.is_action_pressed("jump") and player.is_on_floor():
		state_machine.change_to("jump")
	if event.is_action_pressed("attack"):
		state_machine.change_to("attack")
	if event.is_action_pressed("shoot"):
		state_machine.change_to("shoot")
	#if Input.is_action_just_pressed("jump") and player.is_on_floor():
		#state_machine.change_to("player_jump")
	#elif Input.is_action_just_pressed("attack"):
		#state_machine.change_to("player_attack")
	#elif not (Input.is_action_pressed("left") or Input.is_action_pressed("right")):
		#state_machine.change_to("player_idle")
