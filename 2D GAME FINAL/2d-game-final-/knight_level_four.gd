extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var animated_sprite = $AnimatedSprite2D  # Ensure an AnimatedSprite2D node exists

var play_cinematic = false
var move = 1
func _ready():
	if Globals.coins >= 25:
		queue_free()
	else:
		animated_sprite.flip_h = true
		$"../Workbench/Area2D".queue_free()
		$"../Hint".queue_free()
		$Timer.start()
		$Timer2.start()
		$AudioStreamPlayer.play()
func _physics_process(delta: float) -> void:
	if play_cinematic == true:
		$Camera2D.make_current()
		
		animated_sprite.play("run")
		position.x -= move
		move_and_slide()
		

		if position.x <= 1130:
			move = 0
			animated_sprite.play("idle")
			$"game over".visible = true
			



func _on_timer_timeout() -> void:
	play_cinematic = true # Replace with function body.


func _on_timer_2_timeout() -> void:
	get_tree().change_scene_to_file("res://loss.tscn")
