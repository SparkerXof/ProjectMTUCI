extends StaticBody3D

@export var bullet : PackedScene
var shoot_timer = SHOOT_DELAY

const SPEED = 8.0
const SHOOT_DELAY = 0.1

func _ready():
	shoot_timer = SHOOT_DELAY

func _process(delta):
	if Input.is_action_pressed("Shoot"):
		if shoot_timer <= 0:
			bullet.instantiate()
			shoot_timer = SHOOT_DELAY
	shoot_timer -= delta

func _physics_process(delta):
	
	var velocity = Vector3()
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("Left", "Right", "Up", "Down")
	var direction = (transform.basis * Vector3(input_dir.x, input_dir.y, 0)).normalized()
	var slow = 1.0
	if Input.is_action_pressed("Slow"):
		slow /= 2
		$HitboxView.visible = true
	else:
		$HitboxView.visible = false
	velocity.x = direction.x * SPEED * delta * slow
	velocity.y = -direction.y * SPEED * delta * slow
	
	move_and_collide(velocity)
