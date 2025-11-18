extends CharacterBody3D

@export var health: int = 3
@export var move_speed : float = 3.0
@export var jump_force : float = 8.0
@export var gravity : float = 20.0
@export var is_jumping : bool

@onready var camera : Camera3D = $Camera3D

func _physics_process(delta: float) -> void:
	if global_position.y < -5:
		_game_over()
	#apply gravity
	velocity.y -= gravity*delta
	
	
	#implement jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_force
		is_jumping = true
	elif is_on_floor():
		is_jumping = false
	
	
	#implement movement
	var move_input : Vector2 = -Input.get_vector("move_right", "move_left", "move_back", "move_forward")
	var move_dir : Vector3 = Vector3(move_input.x, 0 , move_input.y)
	velocity.x = move_dir.x * move_speed
	velocity.z = move_dir.z * move_speed
	print(move_dir)
	
	move_and_slide()
	
	
func take_damage(amount : int):
	health -= amount
	if health <= 0:
		_game_over()
		
func _game_over():
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
	
	
	
	
	
	
