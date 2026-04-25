extends Node2D

class_name ItemTest

var character1: DecoratedCharacter
var cleric1: Cleric

var test_count = 1

func _ready() -> void:
	character1 = CharacterBuilder.new().set_item(Item.new("Sword", Item.ItemType.Weapon, 5)).build()
	cleric1 = CharacterFactory.createCleric()
	if(run_tests()): print("ItemTest: all tests pass")
	else: print("ItemTest: test "+ str(test_count) + " failed")
	
	
func run_tests() -> bool:
	if(!test_atk_increase()): return false
	test_count += 1
	if(!test_combat_against_cleric()): return false
	test_count += 1
	return true

func test_atk_increase() -> bool:
	if(character1.myself.ATK != Character.DEFAULT_ATK + 5): return false
	return true
	
func test_combat_against_cleric() -> bool:
	character1.fight(cleric1)
	if(cleric1.hp != cleric1.max_hp - (Character.DEFAULT_ATK - cleric1.DEF + 5)): return false
	return true
