extends Node

var main_scene = "res://main.tscn"
var title_scene = "res://title.tscn"
var gameover_scene = "res://gameOver.tscn"

var current_scene

func _ready():
	current_scene = get_tree().get_root().get_node("title")

func goto_scene(new_scene):
	var scn = load(new_scene).instance()
	get_tree().get_root().call_deferred("add_child", scn)
	current_scene.call_deferred("queue_free")
	current_scene = scn
