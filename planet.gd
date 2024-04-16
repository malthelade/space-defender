extends Node2D
@onready var damage_timer = $Damagetimer
@onready var gamestate = get_node("/root/Gamestate")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


	
func _on_area_2d_body_entered(body):
	if body.is_in_group('enemies'):
		gamestate.enemy_counter +=1
		damage_timer.start()
	



func _on_timer_timeout():
	gamestate.planet_health -= gamestate.enemy_counter * 5
	


