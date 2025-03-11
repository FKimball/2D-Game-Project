extends AudioStreamPlayer2D

var playsound = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_coin_speed_up() -> void:
	if playsound == true:
		play(0.0) # Replace with function body.



func _on_pouch_dontplaysfx() -> void:
	playsound = false
	$SoundTimer.start()
	

func _on_sound_timer_timeout() -> void:
	playsound = true # Replace with function body.
