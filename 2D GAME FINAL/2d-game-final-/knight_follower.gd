extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D  # Ensure an AnimatedSprite2D node exists

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animated_sprite.flip_h = true
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	animated_sprite.play("run")
	if $"..".move == 0:
		animated_sprite.play("idle")
