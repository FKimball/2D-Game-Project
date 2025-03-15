extends CharacterBody2D

@export var spawn_point: Vector2

@onready var sound = $AudioStreamPlayer2D

var is_jumping = false

const SPEED = 300.0
const JUMP_VELOCITY = -500.0

func _ready():
	global_position = spawn_point
	print("Hello")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if Input.is_action_just_pressed("jump"):
		is_jumping = true
		$Timer.start()
		$AnimatedSprite2D.play("jump")
		

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("left", "right")
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

	move_and_slide()

# Detect collision with the enemy
func _on_Enemy_area_entered(area: Area2D):
	if area.is_in_group("enemy"):  # Assuming the enemy is in the "enemy" group
		global_position = spawn_point  # Reset the player position to spawn point


func _on_timer_timeout() -> void:
	is_jumping = false # Replace with function body.
