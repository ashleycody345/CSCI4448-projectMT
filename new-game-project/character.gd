extends Node2D

class_name Character

const DEFAULT_HP = 100

# member variables
@export var hp: int = DEFAULT_HP
@export var is_player: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass
