extends CharacterBody2D
@onready var sprite = $Sprite2D
var speed = 400.0
var button = 0
var gravity = 1200.0  
var max_jumps = 2
var jumps_left = max_jumps
func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		jumps_left = max_jumps
	velocity.x = 0
	if Input.is_action_pressed("Shift") and is_on_floor():
		if sprite.flip_h:
			velocity.x = -speed * 3
		elif not sprite.flip_h:
			velocity.x = speed * 3
	elif Input.is_action_pressed("ui_left"):
		sprite.flip_h = true
		velocity.x = -speed
	elif Input.is_action_pressed("ui_right"):
		sprite.flip_h = false
		velocity.x = speed
	if Input.is_action_just_pressed("ui_up") and jumps_left > 0:
		velocity.y = -500
		jumps_left -= 1
	if Input.is_action_pressed("R"):
		get_tree().change_scene_to_file("res://Level_1.tscn")
	move_and_slide()
