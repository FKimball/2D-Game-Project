extends Sprite2D

@export var global_speed = 160
var speed = global_speed

# Called when the node enters the scene tree for the first time.
func _ready() -> void: 
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	position.x += speed*_delta
	if position.x >= 826:
		speed = speed*-1
	elif position.x <= 276:
		speed = speed*-1



func _on_coin_speed_up() -> void:
	if speed < 0:
		speed -= 18
	elif speed > 0:
		speed += 18
	
