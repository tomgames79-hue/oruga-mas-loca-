extends Area2D



func _on_body_entered(body: Node2D) -> void:
	GameGlobals.player_position = body.global_position
	body.jump_egg = true
