extends Node2D

signal souffle_now(souffle_instance, pos)

var activated = false

var speed = 170
var velocity = Vector2.ZERO

var souffle = load("res://souffle.tscn")

func get_input():
	velocity.x = 0
	if Input.is_action_pressed("ui_right") or $right.is_pressed():
		velocity.x += speed
	if Input.is_action_pressed("ui_left") or $left.is_pressed():
		velocity.x -= speed

func _physics_process(_delta):
	if activated:
		get_input()
		velocity = $body.move_and_slide(velocity, Vector2.UP)

func spawn_souffle():
	if activated:
		emit_signal("souffle_now", souffle, $body/pos.global_position)

func activate():
	activated = true
func deactivate():
	activated = false
