extends Node2D
@onready var planet = $Planet
var enemy = preload("res://enemyspaceship.tscn")
@onready var spawnlocation = $Spawnpath/spawnlocation

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	




func _on_enemy_timer_timeout():
	spawnlocation.progress_ratio = randf()
	var enemy_instance = enemy.instantiate()
	enemy_instance.planet_pos = $Planet.position
	add_child(enemy_instance)
	enemy_instance.position = spawnlocation.position
	print(enemy_instance.position)
