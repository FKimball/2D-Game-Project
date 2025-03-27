extends AnimatedSprite2D

var in_miner = false
var interactable = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if in_miner == true && interactable == true:
		if Input.is_action_just_pressed("ui_up"):
			$"../gold_given".play()
			play("happy")
			$"../miner_text".text = "___________________________________
|  Really? Thanks, this is more |
|  than I mine in a week!           |
|_________________________________|
" + "          V"
			interactable = false
			$"../Icon".pouches_left -= 1


func _on_area_2d_miner_body_entered(body: Node2D) -> void:
	$"../miner_text".visible = true
	in_miner = true # Replace with function body.


func _on_area_2d_miner_body_exited(body: Node2D) -> void:
	$"../miner_text".visible = false # Replace with function body.
	in_miner = false
