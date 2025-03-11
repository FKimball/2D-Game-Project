extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -500.0

func _ready():
	pass
	
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

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
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		$CollisionShape2D/AnimatedSprite2D.play("jump")
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
func _process(_delta: float) -> void:

	var direction := Input.get_axis("left", "right")
	if direction:
		if direction == -1:
			$CollisionShape2D/AnimatedSprite2D.play("run")
			$CollisionShape2D/AnimatedSprite2D.flip_h = true
		else:
			$CollisionShape2D/AnimatedSprite2D.flip_h = false
			velocity.x = direction * SPEED
			$CollisionShape2D/AnimatedSprite2D.play("run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		$CollisionShape2D/AnimatedSprite2D.play("idle")
