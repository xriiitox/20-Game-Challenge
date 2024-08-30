extends Node2D

var enemy = preload("res://enemy.tscn")
var UFO = preload("res://ufo.tscn")
var num_enemies := 0
var ufos := 0

var moving_left := false

func _ready() -> void:
	for i in 5:
		for j in 11:
	#for i in 1:
		#for j in 1:
			var new_enemy := enemy.instantiate()
			new_enemy.global_position = Vector2(160 + (j * 15 * 6), 60 + (i * 12 * 6))
			$Enemies.add_child(new_enemy)
			num_enemies += 1
	ReverseReverse.add_score.connect(_more_score)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if num_enemies == 0:
		get_tree().change_scene_to_file("res://win.tscn")
	if ufos == 0:
		$UFONoise.stop()
		

# more score and seven years ago
func _more_score(num: int) -> void:
	$Label.text = str(int($Label.text) + num)


func _on_ufo_spawner_timeout() -> void:
	var new_ufo := UFO.instantiate()
	add_child(new_ufo)
	ufos += 1
	if ufos == 1:
		$UFONoise.play()
