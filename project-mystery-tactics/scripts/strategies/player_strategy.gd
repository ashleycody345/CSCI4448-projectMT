extends Strategy

class_name PlayerStrategy


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func selectAction(myself: Character, map: GameMap) -> Command:
	if (!Input.is_action_just_pressed("mouse_left_click")):
		return null
	
	var valid_moves: Array[Vector2i] = map.get_navigable_tiles(myself)
	var valid_enemies: Array[Character] = map.get_fightable_characters(myself)
	
	var character_selected: Character = map.select_child_hovered_over()
	var tile_selected: Vector2i = map.select_tile_hovered_over()
	
	if (character_selected == myself):
		return SleepCommand.new()
	
	elif (character_selected in valid_enemies):
		var fight_command: Command = FightCommand.new()
		fight_command.set_opponent(character_selected)
		
		for move in valid_moves:
			if !(abs(move.x - character_selected.map_pos.x) + abs(move.y - character_selected.map_pos.y) == 1):
				valid_moves.erase(move)
		fight_command.set_target(valid_moves.pick_random())
		
		return fight_command
	
	elif (tile_selected in valid_moves):
		var move_command: Command = MoveCommand.new()
		move_command.set_target(tile_selected)
		return move_command
		
	else:
		return null
