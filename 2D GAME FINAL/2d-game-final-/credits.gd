extends Node2D

var roll = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AudioStreamPlayer.play()
	$Timer.start() # Replace with function body.
	$Timer2.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if roll == true:
		$Label.position.y -= 0.32
	if $Label.position.y <= -2692:
		roll = false
	


func _on_timer_timeout() -> void:
	roll = true # Replace with function body.


func _on_timer_2_timeout() -> void:
		get_tree().quit()
