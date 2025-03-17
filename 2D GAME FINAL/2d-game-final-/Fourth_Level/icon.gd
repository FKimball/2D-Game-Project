extends CharacterBody2D


const SPEED = 400.0
const JUMP_VELOCITY = -450.0

var in_workbench = false
var is_jumping = false
var pouches_left = 5

func _physics_process(_delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * _delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
func _ready() -> void:
	pass
		
func _process(_delta: float) -> void: 
	if in_workbench == true:
		if Input.is_action_just_pressed("ui_up"):
			get_tree().change_scene_to_file("res://Fourth_Level/coindropper.tscn")
	
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		if direction == -1:
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false
		velocity.x = direction * SPEED
		if is_jumping == false:
			$AnimatedSprite2D.play("run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if is_jumping == false:
			$AnimatedSprite2D.play("idle")
	if Input.is_action_just_pressed("ui_accept"):
		is_jumping = true
		$Timer.start()
		$AnimatedSprite2D.play("jump")
	
	$Pouches.text = "Pouches left to distribute: " + str(pouches_left) + "/5"
	
func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	in_workbench = true

func _on_area_2d_body_shape_exited(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	in_workbench = false 

func _on_timer_timeout() -> void:
	is_jumping = false # Replace with function body.


func _on_area_2d_body_entered(_body: Node2D) -> void:
	$Label.visible = true # Replace with function body.
