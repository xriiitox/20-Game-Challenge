extends Area2D

var speed := 4.2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if position.y < $"../Ball".position.y:
		position.y += speed
	elif position.y > $"../Ball".position.y:
		position.y -= speed
	
