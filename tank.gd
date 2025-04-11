extends RigidBody3D

class_name TankMovement

enum Suspension_Type {SUSPENSION} #will need to spread this out to make more objects/tanks

@export var engineHp = 500 #Horseepower of Engine Base is Jumbo Pershing 
@export var tankWeight = 45834.2 #in kg, without full load
@export var shellWeight = 10.94 #in kg, a single 90mm round for the 90mm M3
@export var suspensionType = Suspension_Type.SUSPENSION

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	mass = tankWeight
	
func _input(event):
	if Input.is_action_pressed("Escape"):
			get_tree().quit()
"""

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
"""
