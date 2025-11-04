extends Player_gravity


func start():
	if not player.jump_egg:
		state_machine.change_to("idle")
	else: 
		player.anim.play("jump")
		player.velocity.y = player.jump_force

func on_physic_process(delta):
	super(delta)
	
	#if player.is_on_floor() or player.coyote_jump.time_left > 0:
		#if Input.is_action_just_pressed("jump"):
			#player.velocity.y = player.jump_force
			#player.coyote_jump.stop()
			#state_machine.change_to("idle")
	#elif not player.is_on_floor():
		#if Input.is_action_just_pressed("jump") and player.velocity.y < player.jump_force / 2:
			#player.velocity.y = player.jump_force / 2
	if player.is_on_floor():
		state_machine.change_to("idle")
	#var was_on_floor = player.is_on_floor()
	var dir = Input.get_axis("left","right")
	handle_acceleration(dir, speed, delta)
	apply_friction(dir, delta)
	#var just_left_edge = was_on_floor and not player.is_on_floor() and player.velocity.y >= 0 
	#if just_left_edge:
		#player.coyote_jump.start()

func on_input(event):
	if event.is_action_pressed("attack"):
		state_machine.change_to("attack")
	if event.is_action_pressed("shoot"):
		state_machine.change_to("shoot")
