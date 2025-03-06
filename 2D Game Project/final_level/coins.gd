extends RigidBody2D

@export var speed = 1.1
signal speed_up
signal no_speed_up
var replay_position_y = position.y
var score = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = true # Replace with function body.
	freeze = true
	position.x  = $"../Hand".position.x

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	position.x += speed
	if position.x >= 776:
		speed = speed*-1
	elif position.x <= 276:
		speed = speed*-1
	if Input.is_action_just_pressed("DropCoin"):
		speed = 0
		freeze = false
		
	


func _on_area_2d_body_entered(_body: Node2D) -> void:
	visible = false #CHANGE TO FALSE
	call_deferred("freeze_coin")
	emit_signal("speed_up")
	position.y = replay_position_y
	speed = $"../Hand".speed
	position.x  = $"../Hand".position.x
	score += 1

func _on_area_2d_nothing_body_entered(body: Node2D) -> void:
	visible = false #CHANGE TO FALSE
	call_deferred("freeze_coin")
	emit_signal("no_speed_up")
	position.y = replay_position_y
	speed = $"../Hand".speed
	position.x  = $"../Hand".position.x
	
	
func freeze_coin() -> void:
	freeze = true


func _on_timer_timeout() -> void:
	visible = true
