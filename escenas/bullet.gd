extends Area2D

var velocidad_bullet = 200


func _ready():
	pass


func _process(delta):
	position.x += velocidad_bullet * delta
	$AnimatedSprite2D.play("default")
