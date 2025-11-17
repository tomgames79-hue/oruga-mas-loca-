extends Area2D

var velocidad_bullet = 500
@onready var timer: Timer = $Timer


func _ready():
	pass


func _process(delta):
	position.x += velocidad_bullet * delta
	$AnimatedSprite2D.play("default")
	timer.start()


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy") or area.is_in_group("ground"):
		queue_free()


func _on_timer_timeout() -> void:
	queue_free() 


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("ground"):
		queue_free()
