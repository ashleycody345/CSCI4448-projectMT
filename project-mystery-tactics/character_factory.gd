extends Node

# factory definition
class_name CharacterFactory
 
static func createCharacter() -> Character: return Character.new()
static func createFighter() -> Fighter: return Fighter.new()
static func createMage() -> Mage: return Mage.new()
static func createDefender() -> Defender: return Defender.new()
static func createCleric() -> Cleric: return Cleric.new()
