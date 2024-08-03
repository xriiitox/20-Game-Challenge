extends Area2D

var speed := 150

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity := Vector2.ZERO
	if position.y < $"../Ball".position.y:
		velocity.y += speed
	elif position.y > $"../Ball".position.y:
		velocity.y -= speed
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, get_viewport_rect().size)
	
