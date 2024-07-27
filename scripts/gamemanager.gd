extends Node2D

var points_coins = 0
@onready var scorepoint = $hud/scorepoint
@onready var win = $hud/win
@onready var end = $end

func add_point():
	points_coins += 1
	scorepoint.text = str(points_coins)
	print("placar: " ,points_coins)
	if points_coins == 10:
		print('Você venceu')
		win.visible = true
		end.start()
		Engine.time_scale = 0.2
		return



func _on_end_timeout():
	Engine.time_scale = 1
	get_tree().change_scene_to_file("res://scenes/menu.tscn") # Replace with function body.
