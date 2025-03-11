extends CharacterBody2D

@export var point_a: Vector2
@export var point_b: Vector2
@export var speed: float = 100.0
@export var stop_time: float = 3.0  # Time to stop at each point
@export var spawn_point: Vector2 = Vector2(1016, 44)

@onready var animated_sprite = $AnimatedSprite2D  # Ensure an AnimatedSprite2D node exists

var target: Vector2
var can_move: bool = true

func _ready():
	target = point_b  # Start moving towards point_b first
	animated_sprite.play("run")  # Start walking animation

func _physics_process(delta):
	if not can_move:
		return
	
	if abs(global_position.x - target.x) < 5.0:
		can_move = false
		animated_sprite.play("idle")  # Play idle animation when stopping
		await get_tree().create_timer(stop_time).timeout
		target = point_a if target == point_b else point_b  # Switch target
		animated_sprite.play("run")  # Resume walking animation
		can_move = true
	
	var direction = Vector2((target.x - global_position.x), 0).normalized()
	
	# Flip sprite based on movement direction
	if direction.x > 0:
		animated_sprite.flip_h = false  # Facing right
	elif direction.x < 0:
		animated_sprite.flip_h = true   # Facing left
	
	velocity = direction * speed
	move_and_slide()
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		$hit.play()
		body.global_position = spawn_point
