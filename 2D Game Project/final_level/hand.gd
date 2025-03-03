extends ColorRect

@export var speed = 2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x += speed
	if position.x >= 1150:
		speed = speed*-1
	elif position.x <= 0:
		speed = speed*-1
