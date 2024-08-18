extends Label


func _process(delta):
	self.text = str(Global.score)

func reload_level():
	get_tree().reload_current_scene()
