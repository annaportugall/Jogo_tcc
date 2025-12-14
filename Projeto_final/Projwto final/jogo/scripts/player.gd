extends KinematicBody2D

var speed = 200
var velocity = Vector2.ZERO
var last_dir = "down"

func _physics_process(delta):
	velocity = Vector2.ZERO

	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
		last_dir = "right"

	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		last_dir = "left"

	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
		last_dir = "down"

	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
		last_dir = "up"
		
	if velocity != Vector2.ZERO:
		$AnimatedSprite.play("walk_" + last_dir)
	else:
		$AnimatedSprite.stop()
		$AnimatedSprite.frame = 0

	velocity = velocity.normalized() * speed
	move_and_slide(velocity)


