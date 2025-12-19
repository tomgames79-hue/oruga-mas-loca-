extends CharacterBody2D

const bullet = preload("res://escenas/bullet_enemy.tscn")
@onready var attack_cooldown: Timer = $AttackCooldown
var facing_right = true
var jugador = null
@onready var sprite_2d: Sprite2D = $Sprite2D
@export var health = 2

func _process(delta: float) -> void:
	if not jugador:
		return
	if jugador.global_position.x > global_position.x:
		facing_right = true
		sprite_2d.flip_h = false
	else:
		facing_right = false
		sprite_2d.flip_h = true
	if health < 0:
		queue_free()

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
		jugador = body


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is Player:
		$Anim.play("idle")


func _on_hit_box_area_entered(area: Area2D) -> void:
	if area.is_in_group("attack") or area.is_in_group("bullet"):
		print("asasa")
		health -= 1
