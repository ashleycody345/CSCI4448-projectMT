extends Strategy

class_name EnemyStrategy


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func selectAction(myself: Character, map: GameMap) -> Command:
	var valid_moves: Array[Vector2i] = map.get_navigable_tiles(myself)
	var enemies: Array[Character] = map.get_fightable_characters(myself)
	var random_choice: int = randi_range(0,2)
	
	if (random_choice == 2 && !enemies.is_empty()):
		var fight_command: Command = FightCommand.new()
		var opponent: Character = enemies.pick_random()
		fight_command.set_opponent(opponent)
		
		for move in valid_moves:
			if !(abs(move.x - opponent.map_pos.x) + abs(move.y - opponent.map_pos.y) == 1):
				valid_moves.erase(move)
		fight_command.set_target(valid_moves.pick_random())
		
		return fight_command
	elif (random_choice == 1):
		var move_command: Command = MoveCommand.new()
		move_command.set_target(valid_moves.pick_random())
		return move_command
	else:
		return SleepCommand.new()
