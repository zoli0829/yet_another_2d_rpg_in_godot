class_name HitBox extends Area2D

# create a signal
signal damaged(damage: int)

func take_damage(damage: int) -> void:
	print("TakeDamage: ", damage)
	#emit the signal passing in the argument from the take_damage function
	damaged.emit(damage)

