extends KinematicBody2D

# Declare member variables here. Examples:
#var velocity = Vector2.ZERO
var screen_size
var speed = 100
var velocity = Vector2.ZERO
const MAX_SPEDD = 25
const ACCELERATION = 150
const FRICTION = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	input_vector.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity = input_vector * ACCELERATION * delta
		#velocity += input_vector * ACCELERATION * delta
		#velocity = velocity.clamped(MAX_SPEDD * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta) 
	#move_and_collide(velocity * delta)
	move_and_collide(velocity)
