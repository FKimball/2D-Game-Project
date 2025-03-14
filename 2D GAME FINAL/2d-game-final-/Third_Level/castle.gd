extends AnimatedSprite2D

@export var coin_value: int = 1
@onready var level = get_tree().get_first_node_in_group("level")

func _ready() -> void:
	play("spin")         # Play the "spin" animation

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		level.add_point(coin_value)
		queue_free()
