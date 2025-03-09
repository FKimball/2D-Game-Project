extends Sprite2D

@export var speed = 1.1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	position.x += speed
	if position.x >= 776:
		speed = speed*-1
	elif position.x <= 276:
		speed = speed*-1



func _on_coin_speed_up() -> void:
	if speed < 0:
		speed -= 0.1
	elif speed > 0:
		speed += 0.1
	
