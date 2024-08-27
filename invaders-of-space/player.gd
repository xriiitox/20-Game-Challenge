extends CharacterBody2D

@export var speed: float
var lives := 3

var can_shoot = true

var bullet = preload("res://bullet.tscn")

func _ready() -> void:
	ReverseReverse.respawn_player.connect(_respawn)

func _physics_process(delta: float) -> void:
	var velocity := Vector2.ZERO
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_just_pressed("shoot") and can_shoot:
		var new_bullet = bullet.instantiate()
		new_bullet.velocity = Vector2(0, -1)
		new_bullet.global_position = $".".global_position + Vector2(0, -20)
		$"..".add_child(new_bullet)
		can_shoot = false
		$ShootTimer.start()
	
	move_and_collide(velocity * speed * delta)
	
	if global_position.x > 1280:
		global_position.x = 1280
	elif global_position.x < 0:
		global_position.x = 0
		
func _respawn() -> void:
	global_position = Vector2(640, 640)
	get_node("../Lives/" + str(lives)).queue_free()
	lives -= 1
	if lives == 0:
		get_tree().change_scene_to_file("res://lose.tscn")
		pass
	


func _on_shoot_timer_timeout() -> void:
	can_shoot = true
