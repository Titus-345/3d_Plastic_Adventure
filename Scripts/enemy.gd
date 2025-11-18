extends Area3D
@export var move_speed: float = 2.0
@export var move_direction: Vector3
@export var spin_speed: float = 900.0

@onready var start_pos: Vector3 = global_position
@onready var target_pos: Vector3 = start_pos + move_direction
@onready var model = $Model

func _process(delta: float) -> void:
	#global_position = global_position.move_toward(target_pos, move_speed * delta)
	
	self.position.x = sin(Time.get_unix_time_from_system())*5
	
	#if global_position == start_pos:
		#target_pos = start_pos + move_direction
	#elif global_position == start_pos + move_direction:
		#target_pos = start_pos
		
	model.rotation.z += deg_to_rad(spin_speed) * delta

func _on_body_entered(body: Node3D) -> void:
	if not body.is_in_group("Player"):
		return
		
	body.take_damage(1)
	
