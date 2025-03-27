extends AnimatedSprite2D

var in_blacksmith = false
var interactable = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if in_blacksmith == true && interactable == true:
		if Input.is_action_just_pressed("ui_up"):
			$"../gold_given".play()
			play("happy")
			$"../blacksmith_text".text = "___________________________________
|  25 gold coins just for me!?    |
|  Thank you so much!               |
|_________________________________|
" + "           V"
			interactable = false
			$"../Icon/Reminder".visible = false
			$"../Icon".pouches_left -= 1

func _on_area_2d_blacksmith_body_entered(body: Node2D) -> void:
	$"../blacksmith_text".visible = true
	in_blacksmith = true
	
func _on_area_2d_blacksmith_body_exited(body: Node2D) -> void:
	$"../blacksmith_text".visible = false # Replace with function body.
	in_blacksmith = false
