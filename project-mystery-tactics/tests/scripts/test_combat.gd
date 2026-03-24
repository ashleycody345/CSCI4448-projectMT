extends Node2D

class_name CombatTest

var cleric1: Cleric
var fighter1: Fighter
var fighter2: Fighter
var mage1: Mage

var test_count = 1
func _ready() -> void:
	# initialize
	cleric1 = CharacterFactory.createCleric()
	fighter1 = CharacterFactory.createFighter()
	fighter2 = CharacterFactory.createFighter()
	mage1 = CharacterFactory.createMage()
	
	# run test suite
	if(!runTests()):
		print("CombatTest::ERROR: test " + str(test_count) + " failed")
	else:
		print("CombatTest: all tests pass")
	pass
	
func _process(delta) -> void:
	# do nothing each frame after tests pass
	pass

# Runs the test suite. If any test fails, returns false, else returns true
func runTests() -> bool:
	if(!testCombatWithFighters()): return false
	test_count += 1
	if(!testCombatWithFighterAndCleric()): return false
	test_count += 1
	if(!testCombatAgainstCleric()): return false
	test_count += 1
	if(!testCombatWithFighterAndMage()): return false
	test_count += 1
	if(!testCombatWithMageAndCleric()): return false
	return true

func testCombatWithFighters() -> bool:
	# both fighters should lose health equal to atk-def
	fighter1.fight(fighter2)
	if(fighter1.hp == fighter1.max_hp - (fighter2.ATK - fighter1.DEF)): return true
	else: return false

func testCombatWithFighterAndCleric() -> bool:
	# fighter1 lost HP: have cleric1 heal 
	var initial_hp = fighter1.hp
	if(initial_hp == fighter1.max_hp): return false
	cleric1.fight(fighter1)
	if(fighter1.hp <= initial_hp): return false
	return true
	
func testCombatAgainstCleric() -> bool:
	# fighter2 should attack cleric and should not lose health
	var initial_hp = fighter2.hp
	fighter2.fight(cleric1)
	if(cleric1.hp != cleric1.max_hp - (fighter2.ATK - cleric1.DEF)): return false
	if(fighter2.hp != initial_hp): return false
	return true
	
func testCombatWithFighterAndMage() -> bool:
	# fighter2 will fight mage and lose health according to RES instead of DEF
	var initial_hp = fighter2.hp
	fighter2.fight(mage1)
	if(fighter2.hp != initial_hp - (mage1.ATK - fighter2.RES)): return false
	return true
	
func testCombatWithMageAndCleric() -> bool:
	# mage fights cleric, should deal 0 damage
	var initial_hp = cleric1.hp
	mage1.fight(cleric1)
	if(cleric1.hp != initial_hp): return false
	return true
