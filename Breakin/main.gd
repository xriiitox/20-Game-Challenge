extends Node2D

var brick = preload("res://brick.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in 8:
		for j in 14:
			var new_brick := brick.instantiate()
			new_brick.position = Vector2(45 + j * 90 + 10, 50 + i * 30 + 10)
			add_child(new_brick)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
