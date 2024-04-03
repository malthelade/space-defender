extends CharacterBody2D


const SPEED = 300.0
@export var planet_pos = Vector2.ZERO



func _physics_process(delta):
	
	var direction = (planet_pos - position).normalized()
	
	
	velocity = direction * SPEED
	move_and_slide()


