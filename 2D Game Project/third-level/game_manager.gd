extends Node2D

@onready var points_label = $"../UI/Panel/Label"
var points = 0

func add_point():
	points += 1
	$AudioStreamPlayer2D.play()
	print(points)
	points_label.text = "Coins: " + str(points)
