extends Node2D

var moving_left := false

var can_reverse := true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ReverseReverse.move_timer.timeout.connect(_on_between_moves_timeout)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_reverse_reverse() -> void:
	pass
	
func _on_between_moves_timeout() -> void:
	if moving_left:
		global_position.x -= 5
	else:
		global_position.x += 5


func _on_wall_body_entered(body: Node2D) -> void:
	if can_reverse:
		can_reverse = false
		$ReverseCooldown.start()
		moving_left = not moving_left
		position.y += 10


func _on_reverse_cooldown_timeout() -> void:
	can_reverse = true
