extends Node2D

class_name StrategyTest

var character1: Character
var map: GameMap
var character_strategy: Strategy

func _ready() -> void:
	if(test_command_and_strategy() == false):
		print("StrategyTest: test 1 failed")
	else:
		print("StrategyTest: all tests pass")

func test_command_and_strategy() -> bool:
	character1 = CharacterFactory.createCharacter()
	map = GameMap.new()
	character_strategy = PlayerStrategy.new()
	character1.strategy = character_strategy
	var action: Command = character1.selectAction(map)
	
	# should be null, as no player input is made
	if(action != null): return false
	
	character1.strategy = EnemyStrategy.new()
	action = character1.selectAction(map)
	
	if(action == null): return false
	
	return action.execute(character1)
	
