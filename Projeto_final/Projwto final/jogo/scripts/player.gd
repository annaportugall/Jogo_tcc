extends KinematicBody2D

export(int) var player_id = 1


var speed = 200
var velocity = Vector2.ZERO
var last_dir = "down"

var score = 0

func _ready():
	add_to_group("player")
	
func _physics_process(delta):
	velocity = Vector2.ZERO
	
	var right
	var left
	var down
	var up

	if player_id == 1:
		right = "ui_right"
		left  = "ui_left"
		down  = "ui_down"
		up    = "ui_up"
	else:
		right = "p2_right"
		left  = "p2_left"
		down  = "p2_down"
		up    = "p2_up"

	if Input.is_action_pressed(right):
		velocity.x += 1
		last_dir = "right"
	if Input.is_action_pressed(left):
		velocity.x -= 1
		last_dir = "left"
	if Input.is_action_pressed(down):
		velocity.y += 1
		last_dir = "down"
	if Input.is_action_pressed(up):
		velocity.y -= 1
		last_dir = "up"

	if velocity != Vector2.ZERO:
		$AnimatedSprite.play("walk_" + last_dir)
	else:
		$AnimatedSprite.stop()
		$AnimatedSprite.frame = 0

	move_and_slide(velocity.normalized() * speed)
