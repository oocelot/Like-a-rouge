extends Area2D

var count = 1

signal leaving_level

func _on_ExitDoor_body_entered(body):
	if body.name == "Player":
		emit_signal("leaving_level")
		Global.score += 1
