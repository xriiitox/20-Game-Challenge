extends CharacterBody2D

@export var speed: float
var lives := 3
@onready var Main := $".."

# Called when the node enters the scene tree for the first time.
func _ready():
	velocity = Vector2(1, 1).normalized()
	global_position = Vector2(240, 360)
	$"../Paddle".balls.connect(_on_paddle_balls)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Main.bricks_left == 0:
		$"../WinText".visible = true
		$"../Win".play()
		process_mode = Node.PROCESS_MODE_DISABLED
	var collision = move_and_collide(velocity.normalized() * speed * delta)
	
	if global_position.y <= 0:
		velocity.y = -velocity.y
		$"../PaddleSFX".play()
	
	if global_position.y >= 720:
		process_mode = Node.PROCESS_MODE_DISABLED
		global_position = Vector2(240, 360)
		velocity = Vector2(1, 1).normalized()
		get_node("../Lives/" + str(lives)).queue_free()
		lives -= 1
		$"../Lose".play()
		if lives == 0:
			get_tree().change_scene_to_file("res://lose.tscn")
	
	if collision:
		var collider := collision.get_collider()
		if collider.has_method("hit"):
			velocity = velocity.bounce(collision.get_normal())
			collision.get_collider().hit()
			Main.bricks_left -= 1
			$"../Score".text = str(int($"../Score".text) + 10)
			$"../Brick".play()
		elif collider.name == "WallLeft" or collider.name == "WallRight":
			velocity = velocity.bounce(collision.get_normal())
			$"../PaddleSFX".play()
		else:
			velocity = global_position - collision.get_collider().global_position
			$"../PaddleSFX".play()
		velocity = velocity.normalized() * speed * delta

func _on_paddle_balls():
	process_mode = Node.PROCESS_MODE_INHERIT
		
