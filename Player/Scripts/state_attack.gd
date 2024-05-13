class_name State_Attack extends State

var attacking : bool = false

@export var attack_sound : AudioStream
@export_range(1, 20, 0.5) var decelarate_speed: float = 5.0

@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var attack_fx_animation_player: AnimationPlayer = $"../../Sprite2D/AttackEffectSprite/AttackFXAnimationPlayer"
@onready var audio_player: AudioStreamPlayer2D = $"../../Audio/AudioStreamPlayer2D"

#states
@onready var walk: State = $"../Walk"
@onready var idle = $"../Idle"


# WHAT HAPPENS WHEN THE PLAYER ENTERS THIS STATE?
func enter() -> void:
	player.update_animation("attack")
	attack_fx_animation_player.play("attack_" + player.anim_direction())
	animation_player.animation_finished.connect(end_attack)
	
	audio_player.stream = attack_sound
	audio_player.pitch_scale = randf_range(0.9, 1.1)
	audio_player.play()
	attacking = true


# WHAT HAPPENS WHEN THE PLAYER EXITS THIS STATE?
func exit() -> void:
	animation_player.animation_finished.disconnect(end_attack)
	attacking = false


# WHAT HAPPENS DURING THE PROCESS UPDATE IN THIS STATE
func process(_delta: float) -> State:
	# decelerates the player whilst attacking
	player.velocity -= player.velocity * decelarate_speed * _delta
	
	if attacking == false:
		if player.direction == Vector2.ZERO:
			return idle
		else:
			return walk
	return null


# WHAT HAPPENS DURING THE PHYSICS_PROCESS UPDATE IN THIS STATE
func physics(_delta: float) -> State:
	return null


# WHAT HAPPENS WITH INPUT EVENTS IN THIS STATE
func handle_input(_event: InputEvent) -> State:
	return null


func end_attack(_new_animation_name: String) -> void:
	attacking = false
