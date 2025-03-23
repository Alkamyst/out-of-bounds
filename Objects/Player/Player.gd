extends CharacterBody3D


const SPEED = 5.0
#const JUMP_VELOCITY = 4.5
const CAMERA_SENSITIVITY = 0.0025

@onready var neck: Node3D = $Neck
@onready var camera: Camera3D = $Neck/Camera3D
@onready var raycast: RayCast3D = $Neck/Camera3D/RayCast3D
@onready var hudCircle: TextureRect = %TextureRect
@onready var key = $Neck/Camera3D/key

func _unhandled_input(event):
	if event is InputEventMouseButton:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	elif event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event is InputEventMouseMotion:
			neck.rotate_y(-event.relative.x * CAMERA_SENSITIVITY)
			camera.rotate_x(-event.relative.y * CAMERA_SENSITIVITY)
			camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-90), deg_to_rad(90))

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
	#	velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("Left", "Right", "Forward", "Backward")
	var direction = (neck.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
	
	click_behavior()
	
	if Globals.got_key:
		key.visible = true
	else:
		key.visible = false
		
	if Globals.have_tp:
		$"Neck/Camera3D/Toilet Paper".visible = true
	else:
		$"Neck/Camera3D/Toilet Paper".visible = false
		
	if Globals.have_hand:
		$Neck/Camera3D/HourHand.visible = true
	else:
		$Neck/Camera3D/HourHand.visible = false
	

func click_behavior():	
	if raycast.get_collider() != null:
		if raycast.get_collider().is_in_group("Clickable"):
			hudCircle.scale = Vector2(2, 2)
			if Input.is_action_just_pressed("Click"):	
				raycast.get_collider().clicked()
			return
			
	hudCircle.scale = Vector2(1, 1)
