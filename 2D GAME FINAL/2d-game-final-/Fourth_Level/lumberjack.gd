extends AnimatedSprite2D

var in_lumberjack = false
var interactable = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if in_lumberjack == true && interactable == true:
		if Input.is_action_just_pressed("ui_up"):
			play("happy")
			$"../lumberjack_text".text = "_______________________________________
|  No way! Please, take all of my    |
|  stock, come back anytime!          |
|_____________________________________|
" + "          V"
			interactable = false
			$"../Icon".pouches_left -= 1
	
func _on_area_2d_lumberjack_body_entered(body: Node2D) -> void:
	$"../lumberjack_text".visible = true
	in_lumberjack = true


func _on_area_2d_lumberjack_body_exited(body: Node2D) -> void:
	$"../lumberjack_text".visible = false # Replace with function body.
	in_lumberjack= false
