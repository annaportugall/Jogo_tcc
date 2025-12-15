extends Node2D

onready var camera := $camera as Camera2D

func _ready() -> void:
	camera.add_players($player1)
	camera.add_players($player2)
