extends Area2D

@export var jump = false
@export var attack = false
@export var shoot = false

func _on_body_entered(body: Node2D) -> void:
	print ("huevo +1")
	body.jump_egg = jump
	body.attack_egg = attack
	body.shoot_egg = shoot
	queue_free()
