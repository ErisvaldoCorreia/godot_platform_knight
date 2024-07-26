extends Node2D

var points_coins = 0
@onready var scorepoint = $hud/scorepoint

func add_point():
	points_coins += 1
	scorepoint.text = str(points_coins)
	print("placar: " ,points_coins)

