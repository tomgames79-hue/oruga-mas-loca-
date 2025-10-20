extends Player_gravity

func start():
	player.anim.play("attack")



func on_input(event):pass

	#if Input.is_action_pressed("left") or Input.is_action_pressed("right"):
		#state_machine.change_to("player_walk") 
	#elif Input.is_action_just_pressed("jump"):
		#state_machine.change_to("player_jump")


func _on_anim_animation_finished(anim_name: StringName) -> void:
	player.state_machine.change_to("idle")
