extends Node2D

@onready var points_label: Label = %Label 
var points = 40

func add_point(value: int) -> void:
	points += value
	points_label.text = "Coins: " + str(points)
