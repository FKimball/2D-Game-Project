extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.




func _process(delta):
	if Input.is_key_pressed(KEY_RIGHT):
		play("Run")
		flip_h = false
	elif Input.is_key_pressed(KEY_LEFT):
		play("Run")
		flip_h = true
	else:
		play("Idle")
