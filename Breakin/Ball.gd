extends CharacterBody2D

@export var speed: float

# Called when the node enters the scene tree for the first time.
func _ready():
	velocity = Vector2(1, 1).normalized()
	global_position = Vector2(240, 360)
	$"../Paddle".balls.connect(_on_paddle_balls)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var collision = move_and_collide(velocity.normalized() * speed * delta)
	
	if global_position.x >= 1280 or global_position.x <= 0:
		velocity.x = -velocity.x
	
	if global_position.y <= 0:
		velocity.y = -velocity.y
	
	if global_position.y >= 720:
		process_mode = Node.PROCESS_MODE_DISABLED
		global_position = Vector2(240, 360)
		velocity = Vector2(1, 1).normalized()
	
	if collision:
		if collision.get_collider().has_method("hit"):
			velocity = velocity.bounce(collision.get_normal())
			collision.get_collider().hit()
			$"../Score".text = str(int($"../Score".text) + 10)
		else:
			velocity = global_position - collision.get_collider().global_position
		velocity = velocity.normalized() * speed * delta

func _on_paddle_balls():
	process_mode = Node.PROCESS_MODE_INHERIT
		
