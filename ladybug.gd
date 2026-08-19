extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var glide = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor() and glide == false:
		velocity += get_gravity() * delta
		if Input.is_action_just_pressed("jump"):
			glide = true
			
	if is_on_floor():
		glide = false
		
	if glide == true:
		velocity += get_gravity() * delta * 0.3
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("a", "d")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
