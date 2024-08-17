extends Node2D

var enemy = preload("res://enemy.tscn")

func _ready() -> void:
	for i in 5:
		for j in 11:
			var new_enemy := enemy.instantiate()
			new_enemy.global_position = Vector2(20 + 10 * i + 39, 100 + 15 * j + 24)
			add_child(new_enemy)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
