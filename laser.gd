extends Area2D

var travelled_distance = 0
@export var speed = 1000
@export var damage = 1
const RANGE = 500
@onready var upgrades = get_node("/root/Upgrades")



# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite2D.texture = upgrades.laser_skin


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * speed * delta
	
	travelled_distance += speed * delta
	if travelled_distance > RANGE:
		queue_free()



func _on_body_entered(body):
	if body.is_in_group("enemies"):
		body.health -= damage
	queue_free()
		
	
