extends Player_gravity

func start():
	player.anim.play("attack")


func _on_anim_animation_finished(anim_name: StringName) -> void:
	player.state_machine.change_to("idle")
