extends CharacterBody2D

@export var spawn_point: Vector2

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _ready():
	spawn_point = Vector2(1016, 44) 
	global_position = spawn_point

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		$AnimatedSprite2D.play("jump")
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("left", "right")
	if direction:
		if direction == -1:
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false
		velocity.x = direction * SPEED
		$AnimatedSprite2D.play("run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		$AnimatedSprite2D.play("idle")

	move_and_slide()

# Detect collision with the enemy
func _on_Enemy_area_entered(area: Area2D):
	if area.is_in_group("enemy"):  # Assuming the enemy is in the "enemy" group
		global_position = spawn_point  # Reset the player position to spawn point
