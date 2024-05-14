class_name Plant extends Node2D


func _ready():
	$HitBox.damaged.connect(on_take_damage)


func on_take_damage(_damage: int) -> void:
	queue_free()
