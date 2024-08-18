extends Node

func _input(event):
	if event is InputEventKey and event.pressed:
		load_game_scene()

func load_game_scene():
	# Загружаем игровую сцену
	var game_scene = preload("res://World.tscn")  # Замените "GameScene.tscn" на путь к вашей игровой сцене
	get_tree().change_scene_to(game_scene)
