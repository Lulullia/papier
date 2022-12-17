extends KinematicBody2D

var velocity = Vector2.ZERO
var gravity_ = -5

var active = true

#var force = Vector2(10, 10)

func _physics_process(_delta):
	if active:
		global_position.y += gravity_
#		velocity.y += gravity
#		velocity = move_and_slide(velocity, Vector2.UP)

func start():
	active = true
	$Sprite.playing = true

func _on_Sprite_animation_finished():
	call_deferred("queue_free")

#func _on_souffle_body_entered(body):
#	body.propulse(global_position, force)
#	active = false
