extends AnimatedSprite2D

var in_gatherer = false
var interactable = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	flip_h = true # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if in_gatherer == true && interactable == true:
		if Input.is_action_just_pressed("ui_up"):
			play("happy")
			$"../gatherer_text".text = "_______________________________________
|  I can buy a whole forest with     |
|  that, thank you so much!            |
|____________________________________ |
" + "          V"
			interactable = false
			$"../Icon".pouches_left -= 1
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	$"../gatherer_text".visible = true
	in_gatherer = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	$"../gatherer_text".visible = false # Replace with function body.
	in_gatherer = false
