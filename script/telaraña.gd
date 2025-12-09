extends StaticBody2D

var health = 1

func _process(delta: float) -> void:
	if health == 0:
		queue_free()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("bullet"):
		health -= 1
