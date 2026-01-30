extends Node2D

var player_scene = preload("res://scene/player.tscn")
var screen_size = Vector2()
var player_size = Vector2()

func _ready() -> void:
	screen_size = get_viewport_rect().size
	add_player()


func _process(delta: float) -> void:
	pass

func add_player():
	var player = player_scene.instantiate()
	player_size = player.get_node("player sprite").texture.get_size()
	print(player_size)
	var x = screen_size.x/2 - player_size.x/2
	var y = screen_size.y - player_size.y/2 - 16
	player.position.x = x
	player.position.y = y
	add_child(player)
