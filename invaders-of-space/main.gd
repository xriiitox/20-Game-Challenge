extends Node2D

var enemy = preload("res://enemy.tscn")
var enemies: Array[Array] # 2d array to adjust size of boundary box

var moving_left := false

func _ready() -> void:
	for i in 5:
		for j in 11:
	# for i in 1:
		# for j in 1:
			var new_enemy := enemy.instantiate()
			new_enemy.global_position = Vector2(160 + (j * 15 * 6), 60 + (i * 12 * 6))
			add_child(new_enemy)
	ReverseReverse.move_timer.timeout.connect(_move_da_box_sideways)
	ReverseReverse.add_score.connect(_more_score)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _more_score() -> void:
	$Label.text = str(int($Label.text) + 10)

func _move_da_box_sideways() -> void:
	$BoundaryBox.global_position.x += -5 if moving_left else 5

func move_da_box_down() -> void:
	$BoundaryBox.global_position.y += 10
	moving_left = not moving_left

func _on_boundary_box_body_entered(body: Node2D) -> void:
	if body.name == "WallLeft" or body.name == "WallRight":
		move_da_box_down()
		ReverseReverse.reverse.emit()
