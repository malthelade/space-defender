extends Area2D

var travelled_distance = 0
@export var speed = 1000
const RANGE = 1200



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * speed * delta
	
	travelled_distance += speed * delta
	if travelled_distance > RANGE:
		queue_free()



func _on_body_entered(body):
	if body.is_in_group("enemies"):
		body.health -= 1
	queue_free()
		
	
