extends CharacterBody2D

@export var speed: float
var direction := Vector2(1, 1).normalized()

# Called when the node enters the scene tree for the first time.
func _ready():
	velocity = direction * speed


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var collision = move_and_collide(velocity)
	
	if collision:
		velocity = global_position - collision.get_collider().global_position
		velocity = velocity.normalized() * speed * delta
		if collision.get_collider().has_method("hit"):
			collision.get_collider().hit()
			$"../Score".text = str(int($"../Score".text) + 10)

func _on_paddle_balls():
	process_mode = Node.PROCESS_MODE_INHERIT
		
