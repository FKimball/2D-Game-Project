extends Area2D

@export var scene_to_load : PackedScene

func _on_next_level_body_entered(body):
	get_tree().change_scene_to_packed(scene_to_load)
