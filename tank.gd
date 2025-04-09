extends CharacterBody3D

class_name TankMovement

@export var speed = 10 #This is the forward speed of the tank
@export var rotational_speed = 5 #This is the rotational Speed of the tank
@export var sensitivity = 0.005

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event):
	if event is InputEventMouseMotion:
		$Hull/Turret.rotation.y -= event.relative.x * sensitivity
		$Hull/Turret/CameraPivot/Camera.rotation.x -= event.relative.y * sensitivity
		#$Hull.rotation.y = $"CameraPivot/Camera".rotation.y
	if Input.is_action_pressed("Escape"):
		get_tree().quit()

func _physics_process(_delta):
	var input = Input.get_vector("MoveLeft", "MoveRight", "MoveForward", "MoveBack")
	var forward = $"Hull".global_transform.basis.z
	forward.y = 0
	$Hull.rotate()
	velocity = ( forward.normalized() * input.y) * speed
	move_and_slide()
	#move_and_collide()
