extends RigidBody2D

@export var speed_global = 160
var speed = speed_global
signal speed_up
signal no_speed_up
signal full_pouch
signal winpouch

var replay_position_y = position.y
var score = 50
var pouch_score_reset = 0
var pouches_done = 0
var button_visible = false
var is_dropping = false
var wait_outcome = true



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = true # Replace with function body.
	freeze = true
	position.x  = $"../Hand".position.x - 32
	$"../MakePouch".visible = false
	$"../WinButton".visible = false
	$"../ResetButton".visible = false
	score = Globals.coins
	$"../Label".text = "Coins Left " + str(score) + "/" + str(Globals.coins)
	
var queue_teleport: Vector2 
func _integrate_forces(state: PhysicsDirectBodyState2D) -> void: #FUNCTION TO AVOID SNAP-BACK BUG. SOURCE: https://forum.godotengine.org/t/when-changing-the-position-of-my-object-it-teleports-back-to-where-it-was-before-for-no-reason/78354/7
	if queue_teleport != Vector2.ZERO:
		state.transform = Transform2D(0.0, queue_teleport)
		state.linear_velocity = Vector2.ZERO
		queue_teleport = Vector2.ZERO

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	$"../Label".text = "Coins Left: " + str(score) + "/" + str(Globals.coins)
	$"../Label2".text = "Pouches Made: " + str(pouches_done) + "/5"
	position.x += speed*_delta
	if position.x >= 794:
		speed = speed*-1
	elif position.x <= 244:
		speed = speed*-1
	
	if $"../AudioStreamPlayer".playing == false:
		$"../AudioStreamPlayer".play()
		
	if score > 0:
		if (Input.is_action_just_pressed("DropCoin") && is_dropping == false):
			score -= 1
			speed = 0
			freeze = false
			is_dropping = true
			queue_teleport = Vector2($"../Hand".position.x - 32,replay_position_y)
			wait_outcome = true
			$"../Label3".visible = false
			
	if (pouch_score_reset == 5):
		$"../Pouch".play("become_full")
		pouch_score_reset = 0
		button_visible = true
		is_dropping = true
	
	if button_visible == true:
		$"../MakePouch".visible = true
		visible = false
	else:
		visible = true
		
	if score == 0 && wait_outcome == false:
		$"../ResetButton".visible = true
		$"../Hand".speed = 0
		visible = false
	elif pouches_done == 5:
		$"../WinButton".visible = true
		$"../Hand".speed = 0
		emit_signal("winpouch")
		visible = false
	if Input.is_action_just_pressed("Bypass"): #BYPASS MINIGAME
		get_tree().change_scene_to_file("res://Fourth_Level/fourth_level_CONTINUED.tscn")

func _on_win_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Fourth_Level/fourth_level_CONTINUED.tscn")


func _on_reset_button_pressed() -> void:
	get_tree().reload_current_scene()


func _on_area_2d_body_entered(_body: Node2D) -> void:
	visible = false #CHANGE TO FALSE
	call_deferred("freeze_coin")
	emit_signal("speed_up")
	position.y = replay_position_y
	speed = $"../Hand".speed
	position.x = $"../Hand".position.x - 32
	pouch_score_reset += 1
	is_dropping = false
	if pouches_done <4:
		wait_outcome = false

	

func _on_area_2d_nothing_body_entered(body: Node2D) -> void:
	visible = false #CHANGE TO FALSE
	call_deferred("freeze_coin")
	emit_signal("no_speed_up")
	position.y = replay_position_y
	speed = $"../Hand".speed
	position.x  = $"../Hand".position.x - 32
	is_dropping = false
	wait_outcome = false

	
func freeze_coin() -> void:
	freeze = true


func _on_timer_timeout() -> void:
	visible = true



func _on_make_pouch_pressed() -> void:
	emit_signal("full_pouch")
	pouches_done += 1
	button_visible = false
	$"../MakePouch".visible = false
	is_dropping = false # Replace with function body.
	$"../Pouch/smaller_pouch".start()

func _on_smaller_pouch_timeout() -> void:
	$"../Pouch".scale.x -= 0.25
	$"../Pouch".scale.y -= 0.25 # Replace with function body.
