extends Node
var planet_health = 100
var enemy_counter = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if planet_health <= 0:
		get_tree().change_scene_to_file("res://loss_screen.tscn")
