extends CharacterBody3D

class_name TankMovement

@export var speed = 10 #This is the forward speed of the tank
@export var rotational_speed = 5 #This is the rotational Speed of the tank
@export var sensitivity = 0.01

func _input(event):
	if event is InputEventMouseMotion:
		$"CameraPivot/Camera".rotation.y -= event.relative.x * sensitivity
		$"CameraPivot/Camera".rotation.x -= event.relative.y * sensitivity
		$Hull.rotation.y = $"CameraPivot/Camera".rotation.y

func _physics_process(_delta):
	var input = Input.get_vector("ui_right", "ui_left", "ui_up", "ui_down")
	var forward = $"CameraPivot/Camera".global_transform.basis.z
	var right = $"CameraPivot/Camera".global_transform.basis.x
	forward.y = 0
	right.y = 0
	velocity = (right.normalized() * input.x + forward.normalized() * input.y) * speed
	move_and_slide()
	#move_and_collide()
