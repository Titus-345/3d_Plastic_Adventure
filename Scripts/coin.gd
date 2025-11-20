extends Area3D

@export var rotate_speed : float = 180.0
@export var bob_height : float = .1
@export var bob_speed : float = 3.0

@onready var start_y_pos : float = global_position.y

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#Bob the coin
	var time = Time.get_unix_time_from_system()
	var y_mov = sin(time*bob_speed)*bob_height
	global_position.y = start_y_pos + y_mov + .2
	
	
	#Rotate the coin
	rotation.y += deg_to_rad(rotate_speed) * delta
	

func _on_body_entered(body: Node3D) -> void:
	if not body.is_in_group("Player"):
		return
	
	#placeholder for score +=
	self.queue_free()
