extends CharacterBody2D


const SPEED = 300.0
var mouse_position = null



func _physics_process(delta):
	velocity = Vector2.ZERO
	mouse_position = get_global_mouse_position()
	
	look_at(get_global_mouse_position())
	
	if position.distance_to(mouse_position) > 10:
		if Input.is_action_pressed("forward"):
			var direction = (mouse_position - position).normalized()
			velocity = (direction * SPEED)
			
	move_and_slide()
