extends Area2D



# valida que um corpo entrou na area de colisão
func _on_body_entered(_body):
	# imprime no tterminal que o player coletou uma moeda
	print('coletou 1 moeda')
	
	# remove a instância do objeto da cena
	queue_free()
