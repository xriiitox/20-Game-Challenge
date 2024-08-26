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
			$Enemies.add_child(new_enemy)
	ReverseReverse.add_score.connect(_more_score)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# more score and seven years ago
func _more_score() -> void:
	$Label.text = str(int($Label.text) + 10)
