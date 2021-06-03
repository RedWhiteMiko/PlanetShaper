extends KinematicBody2D

var velocity = Vector2(0, 0)
var collision
const SPEED = 192
const JUMPFORCE = -600

var last_collided = null
var move_block = false

func _physics_process(delta):
	if Input.is_action_pressed('left'):
		velocity.x = -SPEED
	if Input.is_action_pressed('right'):
		velocity.x = SPEED
	if Input.is_action_just_pressed('up') and is_on_floor():
		velocity.y = JUMPFORCE
	velocity.y += 30
	
	if (velocity.x != 0 and not move_block) or velocity.y < 0:
		last_collided = null
		
	var collision : KinematicCollision2D = move_and_collide(velocity * delta)
	if collision and collision.collider.name == 'Block':
		print(get_global_transform().origin.y, "|", collision.collider.get_position().y - 30)
		if get_global_transform().origin.y > collision.collider.get_position().y - 30 and get_global_transform().origin.y < collision.collider.get_position().y + 30:
			last_collided = collision.collider
	
	if move_block and last_collided:
		last_collided.move_and_slide(Vector2(velocity.x, 0), Vector2.UP, false, 4, 0.785398, true)
	velocity = move_and_slide(velocity, Vector2.UP, false, 4, 0.785398, true)
	if move_block and last_collided:
		last_collided.move_and_slide(Vector2(velocity.x, 0), Vector2.UP, false, 4, 0.785398, true)
	
	velocity.x = lerp(velocity.x, 0, 0.25)

func _input(event):
	if event is InputEventKey:
		if event.scancode == KEY_P:
			if event.is_pressed():
				move_block = true
			else:
				move_block = false
			
	

func _on_Steve_draw():
	pass # Replace with function body.


func _on_Steve_input_event(viewport, event, shape_idx):
	pass # Replace with function body.


func _on_Steve_ready():
	print(get_position_in_parent())
	pass # Replace with function body.
