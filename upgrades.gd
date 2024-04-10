extends Node

var ship_skin = load("res://spaceship.png")
var laser_skin = load("res://laser.png")
var laser_damage = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func ship_upgrade_1():
	pass

func ship_upgrade_2():
	pass

func laser_upgrade_1():
	laser_damage = 2
	laser_skin = load("res://yellowlaser.png")

func laser_upgrade_2():
	laser_damage = 3
