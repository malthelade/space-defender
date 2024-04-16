extends Control

@onready var upgrades = get_node("/root/Upgrades")
@onready var gamestate = get_node("/root/Gamestate")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_button_pressed():
	upgrades.reset_upgrades()
	gamestate.reset_gamestate()
	get_tree().change_scene_to_file("res://main_menu.tscn")
