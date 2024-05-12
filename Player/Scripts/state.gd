class_name State extends Node

# STORES A REFERENCE TO THE PLAYER THAT THIS STATE BELONGS TO
static var player: Player


func _ready():
	pass


# WHAT HAPPENS WHEN THE PLAYER ENTERS THIS STATE?
func enter() -> void:
	pass


# WHAT HAPPENS WHEN THE PLAYER EXITS THIS STATE?
func exit() -> void:
	pass


# WHAT HAPPENS DURING THE PROCESS UPDATE IN THIS STATE
func process(_delta: float) -> State:
	return null


# WHAT HAPPENS DURING THE PHYSICS_PROCESS UPDATE IN THIS STATE
func physics(_delta: float) -> State:
	return null


# WHAT HAPPENS WITH INPUT EVENTS IN THIS STATE
func handle_input(_event: InputEvent) -> State:
	return null
