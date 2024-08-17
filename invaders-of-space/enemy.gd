extends StaticBody2D

var sprites := ["invader1", "invader2", "invader3"]

var moving_left := false

func _ready() -> void:
	$AnimatedSprite2D.play(sprites[randi() % sprites.size()])
	ReverseReverse.reverse.connect(_on_reverse_reverse)
	ReverseReverse.move_timer.timeout.connect(_on_between_moves_timeout)

func _on_between_moves_timeout() -> void:
	if moving_left:
		global_position.x -= 5
	else:
		global_position.x += 5


func _on_reverse_reverse() -> void:
	moving_left = not moving_left
	global_position.y += 10
