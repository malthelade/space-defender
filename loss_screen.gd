extends Control

@onready var upgrades = get_node("/root/Upgrades")
@onready var gamestate = get_node("/root/Gamestate")

func _on_button_pressed():
	upgrades.reset_upgrades()
	gamestate.reset_gamestate()
	get_tree().change_scene_to_file("res://main_menu.tscn")
