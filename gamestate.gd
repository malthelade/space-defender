extends Node
var planet_health = 100
var enemy_counter = 0

func no_health():
	get_tree().change_scene_to_file("res://loss_screen.tscn")

func reset_gamestate():
	planet_health = 100
	enemy_counter = 0
