extends Player_gravity

const bullet = preload("res://escenas/bullet.tscn")

func start():
	player.anim.play("shoot")
	

#func on_input(event):
	#if Input.is_action_just_pressed("shoot"):
		#if player.attack_cooldown.is_stopped():
			#player.attack_cooldown.start()
			#var shoot = bullet.instantiate()
			#get_parent().add_child(shoot)
			#shoot.position = $Sprite2D.global_position
			#if not player.facing_right:
				#shoot.scale.x *= -1
				#shoot.velocidad_bullet *= -1


func _on_anim_animation_finished(anim_name: StringName) -> void:
	state_machine.change_to("idle")
