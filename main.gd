extends Node2D
@onready var planet = $Planet
var enemy = preload("res://enemyspaceship.tscn")
@onready var spawnlocation = $Spawnpath/spawnlocation
@onready var enemytimer = $EnemyTimer
@onready var upgrademenu = $UpgradeMenu
@onready var upgrades = get_node("/root/Upgrades")
@onready var creditslabel = $CreditsLabel
@onready var gamestate = get_node("/root/Gamestate")
@onready var populationlabel = $PopulationLabel
var kill_counter = 0
var kill_goal = 60
var upgrade_allowed = false


enum {
	ROUND_1,
	ROUND_2,
	ROUND_3,
}

var state = ROUND_1

# Called when the node enters the scene tree for the first time.
func _ready():
	upgrademenu.menu_closed.connect(_on_upgrade_menu_closed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match state:
		ROUND_1:
			round_1_state()
		ROUND_2:
			round_2_state()
		ROUND_3:
			round_3_state()
	
	if upgrade_allowed:
		upgrademenu.visible = true
	
	creditslabel.text = "Credits: "+str(upgrades.credits)
	populationlabel.text = "Population: "+str(gamestate.planet_health)+"%"


func _on_enemy_timer_timeout():
	spawnlocation.progress_ratio = randf()
	var enemy_instance = enemy.instantiate()
	enemy_instance.enemy_death.connect(_on_enemy_death)
	enemy_instance.planet_pos = $Planet.position
	enemy_instance.position = spawnlocation.position
	add_child(enemy_instance)


func round_1_state():
	kill_goal = 10
	if kill_counter == kill_goal:
		enemytimer.stop()
	if kill_counter >= kill_goal and get_tree().get_nodes_in_group("enemies").is_empty():
		upgrade_allowed = true
		

func round_2_state():
	kill_goal = 10
	if kill_counter == kill_goal:
		enemytimer.stop()
	if kill_counter >= kill_goal and get_tree().get_nodes_in_group("enemies").is_empty():
		upgrade_allowed = true
	
func round_3_state():
	kill_goal = 10
	if kill_counter == kill_goal:
		enemytimer.stop()
	if kill_counter >= kill_goal and get_tree().get_nodes_in_group("enemies").is_empty():
		upgrade_allowed = true
	
func _on_enemy_death():
	kill_counter += 1
	upgrades.credits += 1
	
func end_round():
	kill_counter = 0
	if state == ROUND_1:
		state = ROUND_2
		enemytimer.start(0.8)
	elif state == ROUND_2:
		state = ROUND_3
		enemytimer.start(0.6)
	elif state == ROUND_3:
		pass

func _on_upgrade_menu_closed():
	upgrade_allowed = false
	end_round()
