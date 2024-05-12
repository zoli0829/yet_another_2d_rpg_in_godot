class_name State_Idle extends State

@onready var walk: State = $"../Walk"


# WHAT HAPPENS WHEN THE PLAYER ENTERS THIS STATE?
func enter() -> void:
	player.update_animation("idle")
	pass


# WHAT HAPPENS WHEN THE PLAYER EXITS THIS STATE?
func exit() -> void:
	pass


# WHAT HAPPENS DURING THE PROCESS UPDATE IN THIS STATE
func process(_delta: float) -> State:
	if player.direction != Vector2.ZERO:
		return walk
	player.velocity = Vector2.ZERO
	return null


# WHAT HAPPENS DURING THE PHYSICS_PROCESS UPDATE IN THIS STATE
func physics(_delta: float) -> State:
	return null


# WHAT HAPPENS WITH INPUT EVENTS IN THIS STATE
func handle_input(_event: InputEvent) -> State:
	return null
