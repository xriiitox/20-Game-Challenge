extends Area2D

@export var speed: float
var velocity: Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position += velocity * delta * speed


func _on_body_entered(body: Node2D) -> void:
	body.queue_free()
	ReverseReverse.add_score.emit()
	self.queue_free()
