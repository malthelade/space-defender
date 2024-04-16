extends Node

var ship_skin = load("res://spaceship.png")
var ship_speed = 300
var laser_skin = load("res://laser.png")
var laser_damage = 1
var credits = 0


signal update_ship()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func ship_upgrade_1():
	ship_speed = 350
	emit_signal("update_ship")

func ship_upgrade_2():
	ship_speed = 400
	ship_skin = load("res://upgraded_ship.png")
	emit_signal("update_ship")

func laser_upgrade_1():
	laser_damage = 2
	laser_skin = load("res://yellowlaser.png")

func laser_upgrade_2():
	laser_damage = 3
	laser_skin = load("res://redlaser.png")


func reset_upgrades():
	ship_skin = load("res://spaceship.png")
	ship_speed = 300
	laser_skin = load("res://laser.png")
	laser_damage = 1
	credits = 0
