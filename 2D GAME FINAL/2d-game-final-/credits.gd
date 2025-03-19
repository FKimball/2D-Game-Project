extends Node2D

var roll = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AudioStreamPlayer.play()
	$Timer.start() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if roll == true:
		$Label.position.y -= 0.4
		print($Label.position.y)
	if $Label.position.y <= -2052:
		get_tree().paused = true
	


func _on_timer_timeout() -> void:
	roll = true # Replace with function body.
