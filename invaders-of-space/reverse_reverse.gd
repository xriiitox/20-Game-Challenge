extends Node

signal reverse

signal slide # this is definitely for sliding and no other purposes

signal add_score

var move_timer := Timer.new()

func _ready() -> void:
	add_child(move_timer)
	move_timer.start(0.25)

# cha cha real smooth
