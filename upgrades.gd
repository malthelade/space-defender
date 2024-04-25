extends Node

var ship_skin = load("res://spaceship.png")
var ship_speed = 300
var laser_skin = load("res://laser.png")
var laser_damage = 1
var credits = 9999
var ship_level = 0
var laser_level = 0


signal update_ship()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func ship_upgrade_1():
	if ship_level < 1:
		ship_level += 1
		ship_speed = 350
		emit_signal("update_ship")

func ship_upgrade_2():
	if ship_level < 2:
		ship_level += 1
		ship_speed = 400
		ship_skin = load("res://upgraded_ship.png")
		emit_signal("update_ship")

func laser_upgrade_1():
	if laser_level < 1:
		laser_level += 1
		laser_damage = 2
		laser_skin = load("res://yellowlaser.png")

func laser_upgrade_2():
	if laser_level < 2:
		laser_level += 1
		laser_damage = 3
		laser_skin = load("res://redlaser.png")


func reset_upgrades():
	ship_skin = load("res://spaceship.png")
	ship_speed = 300
	ship_level = 0
	laser_skin = load("res://laser.png")
	laser_damage = 1
	laser_level = 0
	credits = 0
