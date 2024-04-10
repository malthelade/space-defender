extends Node2D
@onready var planet = $Planet
var enemy = preload("res://enemyspaceship.tscn")
@onready var spawnlocation = $Spawnpath/spawnlocation
@onready var enemytimer = $EnemyTimer
var kill_counter = 0
var kill_goal = 60


enum {
	ROUND_1,
	ROUND_2,
	ROUND_3,
}

var state = ROUND_1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match state:
		ROUND_1:
			round_1_state()
		ROUND_2:
			round_2_state()
		ROUND_3:
			round_3_state()


func _on_enemy_timer_timeout():
	spawnlocation.progress_ratio = randf()
	var enemy_instance = enemy.instantiate()
	enemy_instance.enemy_death.connect(_on_enemy_death)
	enemy_instance.planet_pos = $Planet.position
	enemy_instance.position = spawnlocation.position
	add_child(enemy_instance)


func round_1_state():
	kill_goal = 60
	if kill_counter == kill_goal:
		enemytimer.stop()

func round_2_state():
	kill_goal = 80
	if kill_counter == kill_goal:
		enemytimer.stop()
	
func round_3_state():
	kill_goal = 100
	if kill_counter == kill_goal:
		enemytimer.stop()
	
func _on_enemy_death():
	kill_counter += 1
