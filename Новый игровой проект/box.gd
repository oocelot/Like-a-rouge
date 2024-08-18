extends Node2D


func create_box_effect():
	var boxEffect = load("res://boxEffect.tscn")
	var BoxEffect = boxEffect.instance()
	var world = get_tree().current_scene
	world.add_child(BoxEffect)
	BoxEffect.global_position = global_position


func _on_Hurtbox_area_entered(area):
	create_box_effect()
	queue_free()
