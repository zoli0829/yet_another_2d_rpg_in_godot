class_name State_Walk extends State

@export var move_speed: float = 100.0

@onready var idle: State = $"../Idle"
@onready var attack: State = $"../Attack"


# WHAT HAPPENS WHEN THE PLAYER ENTERS THIS STATE?
func enter() -> void:
	player.update_animation("walk")
	pass


# WHAT HAPPENS WHEN THE PLAYER EXITS THIS STATE?
func exit() -> void:
	pass


# WHAT HAPPENS DURING THE PROCESS UPDATE IN THIS STATE
func process(_delta: float) -> State:
	if player.direction == Vector2.ZERO:
		return idle
	
	player.velocity = player.direction * move_speed
	
	if player.set_direction():
		player.update_animation("walk")
	return null


# WHAT HAPPENS DURING THE PHYSICS_PROCESS UPDATE IN THIS STATE
func physics(_delta: float) -> State:
	return null


# WHAT HAPPENS WITH INPUT EVENTS IN THIS STATE
func handle_input(_event: InputEvent) -> State:
	if _event.is_action_pressed("attack"):
		return attack
	return null
