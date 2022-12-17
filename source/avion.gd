extends RigidBody2D

signal out_of_bounds

var activated = false

func activate():
	mode = RigidBody2D.MODE_RIGID
	activated = true

func is_active():
	return activated

func _on_VisibilityNotifier2D_screen_exited():
	emit_signal("out_of_bounds")
