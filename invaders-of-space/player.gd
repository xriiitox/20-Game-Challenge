extends CharacterBody2D

@export var speed: float

var bullet = preload("res://bullet.tscn")

func _physics_process(delta: float) -> void:
	var velocity := Vector2.ZERO
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_just_pressed("shoot"):
		var new_bullet = bullet.instantiate()
		new_bullet.velocity = Vector2(0, -1)
		new_bullet.global_position = $".".global_position + Vector2(0, -20)
		$"..".add_child(new_bullet)
	
	move_and_collide(velocity * speed * delta)
	
	if global_position.x > 1280:
		global_position.x = 1280
	elif global_position.x < 0:
		global_position.x = 0
