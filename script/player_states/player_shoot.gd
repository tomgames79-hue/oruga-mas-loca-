extends Player_gravity

func on_physic_process(delta):
	super(delta)
	var dir = Input.get_axis("left", "right")
	handle_acceleration(dir,speed, delta)
	apply_friction(dir, delta)

func start():
	if not player.shoot_egg:
		state_machine.change_to("idle")
	else:
		player.shoot_sound.play()
		player.anim.play("shoot", -1, 1.5)
	



func _on_anim_animation_finished(anim_name: StringName) -> void:
	state_machine.change_to("idle")
