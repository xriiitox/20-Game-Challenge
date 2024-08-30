extends Area2D

@onready var Main = $"/root/Main"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_entered(area: Area2D) -> void:
	# bullet collision
	# there's a funny bug with this where if it bumps into the wall or gets hit by one of the enemies' bullets it still dies
	# im leaving it in lmaoo
	area.queue_free() # remove bulllet
	ReverseReverse.add_score.emit(50) # more points to score
	$CPUParticles2D.emitting = true # start particles
	$Sprite2D.visible = false # hide sprite
	$CollisionShape2D.set_deferred("disabled", true) # remove collision
	$Death.play()
	Main.ufos -= 1
	


# this actually runs when the death sfx finishes playing bc i was too lazy to change the method name
func _on_cpu_particles_2d_finished() -> void:
	queue_free() # remove self


func _on_move_timer_timeout() -> void:
	var tween := create_tween()
	tween.tween_property(self, "global_position", Vector2(randi_range(0, 1280-96), randi_range(0, 720-42)), $MoveTimer.wait_time - 0.5)
