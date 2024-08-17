extends CharacterBody2D

@export var speed: float

func _physics_process(delta: float) -> void:
	var velocity := Vector2.ZERO
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("shoot"):
		pass
		# make bullet object and send forward
	
	move_and_collide(velocity * speed * delta)
