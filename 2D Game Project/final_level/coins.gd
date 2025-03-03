extends RigidBody2D

@export var speed = 2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = true # Replace with function body.
	freeze = true
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x += speed
	if position.x >= 1150:
		speed = speed*-1
	elif position.x <= 0:
		speed = speed*-1

	if Input.is_action_just_pressed("DropCoin"):
		speed = 0
		visible = true
		freeze = false
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	queue_free()
	
