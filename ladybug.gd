extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -300.0

var glide = false
var glide_gravity

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor() and glide == false:
		velocity += get_gravity() * delta
		if Input.is_action_just_pressed("jump"):
			$AnimatedSprite2D.play("Glide")
			glide = true

	if glide == true:
		glide_gravity = get_gravity() * 0.2
		velocity += glide_gravity * delta

	if is_on_floor():
		$AnimatedSprite2D.play("Walk")
		glide = false

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("a", "d")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if direction > 0:
		$AnimatedSprite2D.play()
		$AnimatedSprite2D.flip_h = false
	elif direction < 0:
		$AnimatedSprite2D.play()
		$AnimatedSprite2D.flip_h = true
	elif direction == 0:
		$AnimatedSprite2D.stop()
		
	move_and_slide()
