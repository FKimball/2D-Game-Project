extends RigidBody2D

@export var speed = 1.1
signal speed_up
signal no_speed_up
signal full_pouch

var replay_position_y = position.y
var score = 50
var pouch_score_reset = 0
var pouches_done = 0
var button_visible = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = true # Replace with function body.
	freeze = true
	position.x  = $"../Hand".position.x
	$"../Button".visible = false


	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	$"../Label".text = "Coins Left: " + str(score) + "/50"
	$"../Label2".text = "Pouches Made: " + str(pouches_done) + "/5"
	position.x += speed
	if position.x >= 776:
		speed = speed*-1
	elif position.x <= 276:
		speed = speed*-1
	if score > 0:
		if Input.is_action_just_pressed("DropCoin"):
			score -= 1
			speed = 0
			freeze = false
			pouch_score_reset = 4
			
	if (pouch_score_reset == 5):
		$"../Pouch".play("become_full")
		pouch_score_reset = 0
		button_visible = true
	
	if button_visible == true:
		$"../Button".visible = true
		visible = false
	else:
		visible = true
		
	if score == 40: #CHANGE THIS WHEN GAME IS WORKING
		get_tree().change_scene_to_file("res://main.tscn")



func _on_area_2d_body_entered(_body: Node2D) -> void:
	visible = false #CHANGE TO FALSE
	call_deferred("freeze_coin")
	emit_signal("speed_up")
	position.y = replay_position_y
	speed = $"../Hand".speed
	position.x  = $"../Hand".position.x
	pouch_score_reset += 1

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


func _on_button_pressed() -> void:
	emit_signal("full_pouch")
	pouches_done += 1
	button_visible = false
	$"../Button".visible = false
