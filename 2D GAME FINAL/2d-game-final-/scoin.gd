extends AnimatedSprite2D

@export var coin_value: int = 1  # Default value, can be changed in the editor

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):  # Check if the colliding body is the player
		var level = get_tree().get_first_node_in_group("level")
		if level:
			level.add_point(coin_value)
			$collect.play()
			$"../collected".play()
			queue_free()
