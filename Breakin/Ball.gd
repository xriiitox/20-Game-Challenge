extends Area2D

@export var speed: float
var direction := Vector2(1, 1).normalized()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if position.x > 1280 or position.x < 0:
		direction.x = -direction.x
	if position.y < 0:
		direction.y = -direction.y
	direction = direction.normalized() * speed
	position += direction * delta



func _on_paddle_balls():
	process_mode = Node.PROCESS_MODE_INHERIT


func _on_paddle_area_entered(area):
	direction.y = -direction.y

func _on_brick_area_entered(area):
	pass
