extends AnimatedSprite2D

var full = false
var go_back = false
var game_won = false

signal dontplaysfx

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if full == true:
		position.x -= 2.7
	if position.x <= -200:
		play("become_empty")
		full = false
		go_back = true
	if go_back == true:
		position.x += 2.7
	if position.x >= 576:
		go_back = false
	if game_won == true:
		if position.x <= -100:
			queue_free()

func _on_coin_full_pouch() -> void:
	full = true
	emit_signal("dontplaysfx")
	
func _on_coin_winpouch() -> void:
	game_won = true
