extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous fram e.
func _process(delta: float) -> void:
	pass


func _on_left_goal_area_entered(area: Area2D) -> void:
	$OppaGangnamStyleScore.text = str(int($OppaGangnamStyleScore.text) + 1)
	$Ball.position = Vector2(400, 400)
	$Ball.direction = Vector2(-1, -1).normalized() * $Ball.speed
	$Ball/AnimatedSprite2D.play("default")
	$"Ball/Explo Sion".play()

func _on_right_goal_area_entered(area: Area2D) -> void:
	$PlayerScore.text = str(int($PlayerScore.text) + 1)
	$Ball.position = Vector2(400, 400)
	$Ball.direction = Vector2(-1,-1).normalized() * $Ball.speed
	$Ball/AnimatedSprite2D.play("default")
	$"Ball/Explo Sion".play()
