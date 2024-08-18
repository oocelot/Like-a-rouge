extends Node

func _input(event) -> void:
	if event is InputEventKey and event.pressed:
		load_game_scene()

func load_game_scene():
	# Загружаем игровую сцену
	var game_scene = preload("res://World.tscn")

	get_tree().change_scene_to(game_scene)
	
	
