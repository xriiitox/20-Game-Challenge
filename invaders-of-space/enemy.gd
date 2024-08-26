extends CharacterBody2D

var sprites := ["invader1", "invader2", "invader3"]

var moving_left := false
var bullet = preload("res://bullet.tscn")

func _ready() -> void:
	$AnimatedSprite2D.play(sprites[randi() % sprites.size()])
	ReverseReverse.move_timer.timeout.connect(_on_between_moves_timeout)

func _on_between_moves_timeout() -> void:
	if randf() > 0.98:
		var new_bull = bullet.instantiate()
		new_bull.velocity = Vector2(0, 1)
		new_bull.set_collision_mask_value(2, true)
		new_bull.set_collision_mask_value(1, false)
		new_bull.global_position = global_position + Vector2(36, 24)
		$"/root/Main".add_child(new_bull)
