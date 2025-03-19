extends AnimatedSprite2D

var in_merchant = false
var interactable = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	flip_h = true # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if in_merchant == true && interactable == true:
		if Input.is_action_just_pressed("ui_up"):
			$"../gold_given".play()
			play("happy")
			$"../merchant_text".text = "__________________________________________
|  Hoho! But it's fine with generous  |
|  clients such as yourself!                   |
|_______________________________________|
" + "                                            V"
			interactable = false
			$"../Icon".pouches_left -= 1
	
func _on_area_2d_merchant_body_entered(body: Node2D) -> void:
	$"../merchant_text".visible = true
	in_merchant = true
	
	


func _on_area_2d_merchant_body_exited(body: Node2D) -> void:
	$"../merchant_text".visible = false # Replace with function body.
	in_merchant = false 
