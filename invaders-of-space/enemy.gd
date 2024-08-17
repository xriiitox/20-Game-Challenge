extends CharacterBody2D

var sprites := ["invader1", "invader2", "invader3"]

@export var speed: float

func _ready() -> void:
	$AnimatedSprite2D.play(sprites[randi() % sprites.size()])

func _physics_process(delta: float) -> void:
	pass
