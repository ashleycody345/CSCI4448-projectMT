extends Node2D

class_name CombatTest

var cleric1: Cleric
var fighter1: Fighter
var fighter2: Fighter
func _ready() -> void:
	# initialize
	cleric1 = CharacterFactory.createCleric()
	fighter1 = CharacterFactory.createFighter()
	fighter2 = CharacterFactory.createFighter()
	
	# run test suite
	runTests()
	pass
	
func _process(delta) -> void:
	# do nothing each frame after tests pass
	pass

# Runs the test suite. If any test fails, returns false, else returns true
func runTests() -> bool:
	if(!testCombatWithFighters()): return false
	if(!testCombatWithFighterAndCleric()): return false
	if(!testCombatAgainstCleric()): return false
	if(!testCombatWithFighterAndMage()): return false
	if(!testCombatWithMageAndCleric()): return false
	return true

func testCombatWithFighters() -> bool:
	return true

func testCombatWithFighterAndCleric() -> bool:
	return true
	
func testCombatAgainstCleric() -> bool:
	return true
	
func testCombatWithFighterAndMage() -> bool:
	return true
	
func testCombatWithMageAndCleric() -> bool:
	return true
