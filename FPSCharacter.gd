extends KinematicBody

onready var camera = $Pivot/Camera
var gravity = -30
var max_speed = 8
var mouse_sensitivity = 0.002

var velocity = Vector3()

func get_input():
	var input_direction = Vector3()
	if Input.is_action_pressed("move_forward"):
		input_dir += -camera.global_transform.basis.z
	if Input.is_action_pressed("move_back"):
		input_dir += camera.global_transform.basis.z
	if Input.is_action_pressed("strafe_left"):
		input_dir += -camera.global_transform.basis.x
	if Input.is_action_pressed("strafe_right"):
		input_dir += -camera.global_transform.basis.x
	input_dir = input_dir.normalized()
	return input_dir

func _unhandled_input(event):
	if event is InputEvenMouseMotion:
		rotate_y(-event.relative.x * mouse_sensitivity)
		$Pivot.rotate_x = clamp($Pivot.rotation.x, -1.2, 1.2)
func _physics_process(delta):
	velocity.y += gravity * delta
	var desired_velocity = get_input() * max speed
	
	velocity.x = desired_veloicty.x
	velocity.z = desired_velocity.z
	velocity = move_and_slide(velocity, Vector3.UP, true)
	if jump and is_on_floor():
		velocity.y = jump_speed