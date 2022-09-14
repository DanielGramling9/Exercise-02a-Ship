extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var velocity = Vector2.ZERO
var speed = 5.0
var rotation_speed = 5.0
var max_speed = 500
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(_delta):
	position = position + velocity
	velocity= velocity.normalized()* clamp(velocity.length(),0, max_speed)
	
	$Exhaust.show()
	if Input.is_action_pressed("forward"):
		velocity.y= velocity + Vector2(0,-speed).rotated(rotation)
	if Input.is_action_pressed("left"):
		rotation_degrees= rotation_degrees - rotation_speed
	
	if Input.is_action_pressed("right"):
		rotation_degrees = rotation_degrees + rotation_speed
		
		
	position.x = wrapf(position.x, 0, 1024)
	position.y = wrapf(position.y, 0, 600)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	 pass
