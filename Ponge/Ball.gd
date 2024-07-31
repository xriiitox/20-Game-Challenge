extends Area2D


var speed := 20
var direction: Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	direction = Vector2(-1, -1).normalized() * speed


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += direction * delta * speed
	if position.y < 0 || position.y > get_viewport_rect().size.y:
		direction.y = -direction.y
		$Beep.play()
	if speed >= 100:
		speed = 100

func _on_the_player_balls() -> void:
	process_mode = Node.PROCESS_MODE_INHERIT

func _on_the_player_area_entered(area: Area2D) -> void:
	direction.x = -direction.x
	if randf() > 0.5:
		direction.y = -direction.y
	speed *= 1.05
	$Beep.play()
	

func _on_the_opponent_area_entered(area: Area2D) -> void:
	direction.x = -direction.x
	if randf() > 0.5:
		direction.y = -direction.y
	speed *= 1.05
	$Beep.play()
