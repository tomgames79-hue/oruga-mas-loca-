extends CharacterBody2D

const bullet = preload("res://escenas/bullet.tscn")
@onready var attack_cooldown: Timer = $AttackCooldown
var facing_right = true

func disparo():
	#if Input.is_action_just_pressed("shoot"):
		if attack_cooldown.is_stopped():
			attack_cooldown.start()
			var shoot = bullet.instantiate()
			get_parent().add_child(shoot)
			shoot.position = $Sprite2D.global_position
			if not facing_right:
				shoot.scale.x *= -1
				shoot.velocidad_bullet *= -1


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		$Anim.play("shoot")
