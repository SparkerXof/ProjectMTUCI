extends Area3D
class_name Bullet

# Declare member variables here. Examples:
@export var velocity: Vector3
@export var speed: float

# Called when the node enters the scene tree for the first time.
func _ready():
	velocity = velocity.normalized()

func _process(delta):
	position += velocity * speed * delta

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
