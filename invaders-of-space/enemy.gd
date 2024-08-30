extends CharacterBody2D

var sprites := ["invader1", "invader2", "invader3"]

var bullet = preload("res://bullet.tscn")

var can_shoot := false

func _ready() -> void:
	$AnimatedSprite2D.play(sprites[randi() % sprites.size()])
	ReverseReverse.move_timer.timeout.connect(_on_between_moves_timeout)

func _on_between_moves_timeout() -> void:
	if randf() > 0.99 && can_shoot:
		var new_bull = bullet.instantiate()
		new_bull.velocity = Vector2(0, 1)
		new_bull.set_collision_mask_value(2, true)
		new_bull.set_collision_mask_value(1, false)
		new_bull.global_position = global_position + Vector2(36, 24)
		new_bull.scale.x *= 0.5
		$"/root/Main".add_child(new_bull)


func _on_cpu_particles_2d_finished() -> void:
	queue_free()


func _on_start_game_shoot_timer_timeout() -> void:
	can_shoot = true
