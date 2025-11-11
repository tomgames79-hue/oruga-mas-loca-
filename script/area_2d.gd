extends Area2D

@export var jump = false
@export var attack = false
@export var shoot = false

func _on_body_entered(body: Node2D) -> void:
	print ("huevo +1")
	body.health = 5
	body.update_life()
	if jump:
		body.jump_egg = jump
	if attack: 
		body.attack_egg = attack
	if shoot:
		body.shoot_egg = shoot
	queue_free()
