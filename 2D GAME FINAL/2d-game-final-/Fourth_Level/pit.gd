extends Area2D

#var current_x = 0
#var current_y = 0
#var default_pos_x = 0
#var default_pos_y = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#current_x = $"../Icon/AnimatedSprite2D/Camera2D".position.x
	#current_y =$"../Icon/AnimatedSprite2D/Camera2D".position.y
	pass

func _on_body_entered(body: Node2D) -> void:
	$"../Icon".position.x = 770
	$"../Icon".position.y = 275


func _on_pit_2_body_entered(body: Node2D) -> void:
	$"../Icon".position.x = 770
	$"../Icon".position.y = 275 

func _on_pit_3_body_entered(body: Node2D) -> void:
	$"../Icon".position.x = 770
	$"../Icon".position.y = 275


func _on_pit_4_body_entered(body: Node2D) -> void:
	$"../Icon".position.x = 770
	$"../Icon".position.y = 275 
