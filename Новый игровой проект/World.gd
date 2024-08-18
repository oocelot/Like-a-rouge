extends Node2D

const Player = preload("res://Player.tscn")
const Exit = preload("res://ExitDoor.tscn")
const box = preload("res://box.tscn")
const Enemy = preload("res://Enemy.tscn")

var borders = Rect2(1, 1, 27, 15)

onready var tileMap = $TileMap
var player = null

func _ready():
	randomize()
	generate_level()

func generate_level():
	var walker = Walker.new(Vector2(13, 7), borders)
	var map = walker.walk(200)
	

	player = Player.instance()
	add_child(player)
	player.position = map.front()*48
	
	
	var exit = Exit.instance()
	add_child(exit)
	exit.position = walker.get_end_room().position*48
	exit.connect("leaving_level", self, "reload_level")
	
	#place_object_in_rooms(box, walker.place_box())
	place_object_in_rooms(Enemy, walker.place_enemy())
	
	walker.queue_free()
	for location in map:
		tileMap.set_cellv(location, 0)
	tileMap.update_bitmask_region(borders.position, borders.end)

func reload_level():
	get_tree().reload_current_scene()


func place_object_in_rooms(object_scene: PackedScene, rooms: Array):
	for room in rooms:
		if !(room.position *48).distance_to(player.global_position) < 192:
			var object = object_scene.instance()
			add_child(object)
			object.global_position = room.position*48 + Vector2(rand_range(-12, 12), rand_range(-12, 12))
