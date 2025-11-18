extends MeshInstance3D

@export var rotate_rate : float = 20.0
@export var bob_rate : float = 15
@export var bob_amplitude : float = .05
var target_y_rot: float = 0
@onready var Player : CharacterBody3D = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_smooth_rotation(delta)
	_move_bob()
	
func _smooth_rotation(delta):
	var vel = Player.velocity
	
	if vel.x !=0 or vel.z != 0:
		target_y_rot = atan2(vel.x, vel.z)
		
	rotation.y = lerp_angle(rotation.y, target_y_rot, rotate_rate*delta)
	
func _move_bob():
	var move_speed = Player.velocity.length()
	
	
	
	if move_speed < .1 or not Player.is_on_floor():
		scale.y = 1
		return
	
	var time = Time.get_unix_time_from_system()
	var y_scale = 1 + (sin(time*bob_rate)*bob_amplitude)
	scale.y = y_scale
