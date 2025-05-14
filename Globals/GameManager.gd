extends Node

const MAIN = preload("res://Scenes/Main/Main.tscn")
const GAME = preload("res://Scenes/Game/Game.tscn")
const SIMPLE_TRANSITION = preload("res://Scenes/SimpleTransition/SimpleTransition.tscn")

var next_scene: PackedScene

func load_game_scene() -> void:
	next_scene = GAME
	get_tree().change_scene_to_packed(SIMPLE_TRANSITION)
	
func load_main_scene() -> void:
	next_scene = MAIN
	get_tree().change_scene_to_packed(SIMPLE_TRANSITION)
