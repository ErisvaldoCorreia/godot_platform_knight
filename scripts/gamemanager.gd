extends Node2D

var points_coins = 0
@onready var score_label = $scoreLabel

func add_point():
	points_coins += 1
	score_label.text = "Parabéns, Coletou " + str(points_coins) + " moedas"
	print("placar: " ,points_coins)

