extends CharacterBody2D


const SPEED = 300.0
var mouse_position = null
var laser = preload("res://laser.tscn")
@export var laser_speed = 1000
@export var laser_damage = 1

func _process(delta):
	if Input.is_action_just_pressed("fire"):
		var laser_instance = laser.instantiate()
		laser_instance.position = get_global_position()
		laser_instance.rotation_degrees = rotation_degrees
		laser_instance.damage = laser_damage
		get_tree().get_root().add_child(laser_instance)

func _physics_process(delta):
	velocity = Vector2.ZERO
	mouse_position = get_global_mouse_position()
	
	look_at(get_global_mouse_position())
	
	if position.distance_to(mouse_position) > 10:
		if Input.is_action_pressed("forward"):
			var direction = (mouse_position - position).normalized()
			velocity = (direction * SPEED)
			
	move_and_slide()
