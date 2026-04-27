class_name FightCommand

extends Command

var target: Vector2i
var opponent: Character

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_target(new_target: Vector2i) -> void:
	target = new_target

func set_opponent(new_opponent: Character) -> void:
	opponent = new_opponent

func execute(myself: Character) -> bool:
	print(myself.char_name + " moves to " + str(target.x) + ", " + str(target.y) + " and fights " + opponent.char_name)
	myself.set_map_position(target)
	myself.fight(opponent)
	
	print(myself.char_name + " now has " + str(myself.hp) + " health")
	print(opponent.char_name + " now has " + str(opponent.hp) + " health")
	
	if(myself.isDead()):
		print(myself.char_name + " dies!")
	elif(opponent.isDead()):
		print(opponent.char_name + " dies!")
	else:
		print("Both survive for now...")
	return true
	
