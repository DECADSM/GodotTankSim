extends CharacterBody3D

class_name TankMovement

@export var speed = 10 #This is the forward speed of the tank
@export var rotational_speed = 5 #This is the rotational Speed of the tank
var target_velocity = Vector3.ZERO

func _physics_process(_delta):
	var direction = Vector3.ZERO
	if Input.is_action_pressed("MoveForward"):
		direction.z += 1
	if Input.is_action_pressed("MoveBack"):
		direction.z -= 1
	if Input.is_action_pressed("MoveRight"):
		direction.x += 1
	if Input.is_action_pressed("MoveLeft"):
		direction.x -= 1

	if direction != Vector3.ZERO:
		direction = direction.normalized()
		$Hull.basis = Basis.looking_at(direction)
		
	target_velocity.x = direction.x * speed
	target_velocity.z = direction.z * speed
	velocity = target_velocity
	move_and_slide()
	#move_and_collide()
