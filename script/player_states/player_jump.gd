extends Player_gravity


func start():
	#player.play_animation(player.animations.jump)
	#player.velocity.x = Input.get_axis("left", "right") * speed 
	player.velocity.y = player.jump_force

func on_physic_process(delta):
	super(delta)
	var input_axis = Input.get_axis("left","right")
	if player.is_on_floor() or player.coyote_jump.time_left > 0:
		if Input.is_action_just_pressed("jump"):
			player.velocity.y = player.jump_force
			player.coyote_jump.stop()
			
	elif not player.is_on_floor():
		if Input.is_action_just_pressed("jump") and player.velocity.y < player.jump_force / 2:
			player.velocity.y = player.jump_force / 2
	handle_air_acceleration(input_axis, delta)

func on_input(event):
	if event.is_action_pressed("attack"):
		state_machine.change_to("attack")

func handle_air_acceleration(input_axis, delta):
	if player.is_on_floor(): return
	if input_axis != 0:
		player.velocity.x = move_toward(player.velocity.x, player.speed * input_axis, player.acceleration * delta)
