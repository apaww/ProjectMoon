extends CharacterBody3D

var SPEED := 5.0
var was_on_floor := false
var was_standing := false
const JUMP_VELOCITY := 5.8
var done := false

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _input(event):
	if not Data.isActive:
		return
		
	if event is InputEventMouseMotion:
		rotate_y(deg_to_rad(event.relative.x * -0.1))


func _physics_process(delta: float) -> void:
	if not Data.isActive:
		$JumpSound.stop()
		$StepsSound.stop()
		return
	
	if not done:
		if ((round(global_position.x) == 190) and
			(round(global_position.y) == 60) and 
			(round(global_position.z) == -2)):
				done = true
		if Data.trigger_bird:
			var direction = global_position.direction_to(Vector3(190, 60, -2))
			SPEED = 10
			velocity.x = direction.x * SPEED
			velocity.y = direction.y * SPEED
			velocity.z = direction.z * SPEED
			move_and_slide()
			return
		
			
	# Add the gravity.
	if not is_on_floor():
		was_on_floor = false
		velocity += get_gravity() * delta
	elif was_on_floor == false:
		$JumpSound.play()
		was_on_floor = true
		

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if Input.is_action_pressed("shift", true):
		SPEED = 10.0
	else:
		SPEED = 5.0

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("move_left", "move_right", "move_forward", "move_backwards")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if input_dir == Vector2.ZERO and was_standing == false:
		$StepsSound.stop()
		was_standing = true
	elif input_dir != Vector2.ZERO and was_standing == true:
		$StepsSound.play()
		was_standing = false
		
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
