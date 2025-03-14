extends Node2D

@onready var points_label: Label = %Label 
var points = 0

func _ready():
	points = Globals.coins
	points_label.text = "Coins: " + str(points)
	
func add_point(value:int):
	points += value
	Globals.coins = points
	$AudioStreamPlayer2D.play()
	points_label.text = "Coins: " + str(points)
