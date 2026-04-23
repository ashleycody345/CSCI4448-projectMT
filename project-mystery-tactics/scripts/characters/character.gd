extends Node2D

class_name Character

var char_name: String = "Character"

const DEFAULT_HP = 100
const DEFAULT_ATK = 1
const DEFAULT_DMG_TYPE = DamageType.PHYS
const DEFAULT_DEF = 1
const DEFAULT_RES = 1
const DEFAULT_SPD = 1
const DEFAULT_MOV = 6

enum Team {
	PLAYER,
	ENEMY,
	ALLY,
	NONE
}

enum DamageType {
	PHYS,
	MAG,
	HEAL
}

### member variables

## character properties
# hit points: upon reaching 0, character dies 
@export var max_hp: int = DEFAULT_HP
var hp: int
# Controls whether entity can be controlled by player or computer
@export var is_player: bool = false 	
# Controls which team a player is on: 0 = player, 1 = enemy, 2 = allied (player), 3 = no team
@export var team: Team = Team.NONE
# Location on map to start on
@export var start_pos: Vector2i
var map_pos: Vector2i

# ATK determines damage output or heal output based on ATK_TYPE
var ATK: int = DEFAULT_ATK
# ATK_TYPE determines type of attack, intrinsic to character subclass
var ATK_TYPE: DamageType = DEFAULT_DMG_TYPE
# DEF determines physical damage resistance: damage = ATK - DEF
var DEF: int = DEFAULT_DEF
# RES determines magic damage resistance: damage = ATK - RES
var RES: int = DEFAULT_RES
# SPD determines which unit attacks first in combat - if SPD is equal, then attacker goes first
var SPD: int = DEFAULT_SPD
# MOV determines how many spaces (up, down, left, right) a unit can travel
var MOV: int = DEFAULT_MOV

# character sprite
var sprite: Sprite2D
var sprite_name: String

# sprite names
const PLAYER_SPRITE = "res://resources/circle.png"
const ENEMY_SPRITE = "res://resources/circle_red.png"

func _init() -> void:
	hp = max_hp

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	map_pos = start_pos
	self.scale.x = 0.5
	self.scale.y = 0.5
	# load appropriate sprite
	if(team == Team.ENEMY):
		sprite_name = ENEMY_SPRITE
	else:
		sprite_name = PLAYER_SPRITE
	loadSprite()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func isDead() -> bool:
	return (hp <= 0)
	
func calculateDamage(atk: int, def: int) -> int:
	var dmg = atk - def
	return max(dmg, 0)

# Simulate a fight between self and a target Character
func fight(target: Character) -> void:
	# if I am a HEAL type character, then do not let target counterattack!
	if(self.ATK_TYPE == DamageType.HEAL):
		fightTurnHeal(self, target)
		return
	
	# determine who goes first, then calculate damage
	if(self.SPD >= target.SPD):
		# I go first, then enemy
		fightTurn(self, target)
		fightTurn(target, self)
	else:
		# enemy goes first, then me
		fightTurn(target, self)
		fightTurn(self, target)
	return

# Simulate a single turn of a fight between two characters. Returns amount of remaining defender HP
func fightTurn(attacker: Character, defender: Character) -> int:
	var attack_power: int = attacker.ATK
	
	# set appropriate defense stat
	var defend_power: int = defender.DEF
	if(attacker.ATK_TYPE == DamageType.MAG): defend_power = defender.RES
	# do nothing if attacker is HEAL type
	if(attacker.ATK_TYPE == DamageType.HEAL): return defender.hp
	 
	defender.hp = defender.hp - calculateDamage(attack_power, defend_power)
	return defender.hp

# Simulate a heal turn against a single target. Return target's new HP
func fightTurnHeal(healer: Character, target: Character) -> int:
	target.hp = min(target.max_hp, healer.ATK + target.hp)
	return target.hp
	
func loadSprite() -> void:
	sprite = Sprite2D.new()
	sprite.texture = load(sprite_name)
	self.add_child(sprite)
