extends Area2D

func _on_moeda_body_entered(body):
	if body.is_in_group("player"):
		body.score += 1
		queue_free()
		print("Score do jogador:", body.score)
