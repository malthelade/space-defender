extends CharacterBody2D



var mouse_position = null
var laser = preload("res://laser.tscn")
@onready var upgrades = get_node("/root/Upgrades")
@onready var sprite = $Sprite2D
var SPEED = 300
var drag_factor := 0.1


func _ready():
	upgrades.update_ship.connect(_update_ship)

func _process(delta):
	if Input.is_action_just_pressed("fire"):
		var laser_instance = laser.instantiate()
		laser_instance.position = get_global_position()
		laser_instance.rotation_degrees = rotation_degrees
		laser_instance.damage = upgrades.laser_damage
		get_tree().get_root().add_child(laser_instance)

func _physics_process(delta):
	mouse_position = get_global_mouse_position()
	
	if position.distance_to(mouse_position) > 10:
		if Input.is_action_pressed("forward"):
			var direction = (mouse_position - position).normalized()
			var desired_velocity = SPEED * direction
			var steering_vector = desired_velocity - velocity
			velocity += steering_vector * drag_factor
			position += velocity * delta
			rotation = velocity.angle()
			


func _update_ship():
	SPEED = upgrades.ship_speed
	sprite.texture = upgrades.ship_skin
