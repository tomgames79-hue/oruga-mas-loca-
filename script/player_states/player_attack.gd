extends Player_gravity


func on_physic_process(delta):
	super(delta)
	var dir = Input.get_axis("left", "right")
	handle_acceleration(dir,speed, delta)
	apply_friction(dir, delta)

func start():
	if not player.attack_egg:
		state_machine.change_to("idle")
	else:
		player.attack_sound.play()
		player.anim.play("attack", -1, 2.0)


func _on_anim_animation_finished(anim_name: StringName) -> void:
	player.state_machine.change_to("idle")
