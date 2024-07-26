extends Area2D

@onready var gamemanager = $"../../gamemanager"

# valida que um corpo entrou na area de colisão
func _on_body_entered(_body):
	# imprime no tterminal que o player coletou uma moeda
	print('coletou 1 moeda')
	gamemanager.add_point()
	
	# remove a instância do objeto da cena
	queue_free()
