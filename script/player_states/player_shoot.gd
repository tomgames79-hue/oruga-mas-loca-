extends Player_gravity


func start():
	if not player.shoot_egg:
		state_machine.change_to("idle")
	else:
		player.anim.play("shoot")
	



func _on_anim_animation_finished(anim_name: StringName) -> void:
	state_machine.change_to("idle")
