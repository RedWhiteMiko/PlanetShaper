extends KinematicBody2D

var velocity = Vector2(0, 0)
var collision
const SPEED = 180
const JUMPFORCE = -600

func _physics_process(delta):
	if Input.is_action_pressed('left'):
		velocity.x = -SPEED
	if Input.is_action_pressed('right'):
		velocity.x = SPEED
	if Input.is_action_just_pressed('up') and is_on_floor():
		velocity.y = JUMPFORCE
	velocity.y += 30
		
	velocity = move_and_slide(velocity, Vector2.UP, false, 4, 0.785398, true)
	velocity.x = lerp(velocity.x, 0, 0.25)
