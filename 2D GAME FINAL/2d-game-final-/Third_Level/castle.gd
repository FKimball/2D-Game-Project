extends Node2D

@onready var points_label: Label = %Label 
var points = 40

func add_point(value:int):
	points += value
	$AudioStreamPlayer2D.play()
	points_label.text = "Coins: " + str(points)
