extends KinematicBody2D

var velocity = Vector2(0, 0)

func _physics_process(_delta):
	velocity.y += 30
		
	velocity = move_and_slide(velocity, Vector2.UP)
	velocity.x = lerp(velocity.x, 0, 0.25)
