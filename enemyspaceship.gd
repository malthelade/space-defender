extends CharacterBody2D

@export var health = 2
const SPEED = 300.0
@export var planet_pos = Vector2.ZERO



func _physics_process(delta):
	
	var direction = (planet_pos - position).normalized()
	look_at(planet_pos)
	
	velocity = direction * SPEED
	move_and_slide()
	
	
	if health <= 0:
		queue_free()
	








