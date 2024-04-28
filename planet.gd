extends Node2D
@onready var damage_timer = $Damagetimer
@onready var gamestate = get_node("/root/Gamestate")

func _on_area_2d_body_entered(body):
	if body.is_in_group('enemies'):
		if gamestate.enemy_counter != 0:
			gamestate.enemy_counter += 1
		else:
			gamestate.enemy_counter +=1
			damage_timer.start()

func _on_timer_timeout():
	gamestate.planet_health -= gamestate.enemy_counter * 5
	if gamestate.planet_health <= 0:
		gamestate.no_health()

func _on_area_2d_body_exited(body):
	gamestate.enemy_counter -= 1
