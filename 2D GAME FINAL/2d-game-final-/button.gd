extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if button_pressed == true:
		Globals.coins = 0
		get_tree().change_scene_to_file("res://First_Level/Main Menu.tscn")
