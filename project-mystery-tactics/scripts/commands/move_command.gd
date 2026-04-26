class_name MoveCommand

extends Command

var target: Vector2i

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_target(new_target: Vector2i) -> void:
	target = new_target

func execute(myself: Character) -> bool:
	print(myself.char_name + " moves to " + str(target.x) + ", " + str(target.y))
	myself.set_map_position(target)
	return true
	
