extends Area2D

@export var speed: float
var velocity: Vector2
@onready var Main = $"/root/Main"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position += velocity * delta * speed


func _on_body_entered(body: Node2D) -> void:
	if body.has_method("_on_between_moves_timeout"):
		body.queue_free()
		ReverseReverse.add_score.emit()
		Main.num_enemies -= 1
	else:
		ReverseReverse.respawn_player.emit()
	self.queue_free()
