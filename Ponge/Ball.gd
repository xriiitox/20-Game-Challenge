extends Area2D

@export var direction := Vector2(-1, -1).normalized() * 500

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += direction * delta
	if position.y < 0 || position.y > get_viewport_rect().size.y:
		direction.y = -direction.y

func _on_the_player_balls() -> void:
	process_mode = Node.PROCESS_MODE_INHERIT

func _on_top_wall_area_entered(body: Node2D) -> void:
	direction.y = -direction.y

func _on_bottom_wall_area_entered(body: Node2D) -> void:
	direction.y = -direction.y

func _on_the_player_area_entered(area: Area2D) -> void:
	direction.x = -direction.x

func _on_the_opponent_area_entered(area: Area2D) -> void:
	direction.x = -direction.x
