extends Node2D

class_name Character

const DEFAULT_HP = 100
const DEFAULT_ATK = 1
const DEFAULT_DMG_TYPE = DamageType.PHYS
const DEFAULT_DEF = 1
const DEFAULT_RES = 1
const DEFAULT_SPD = 1

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
var hp: int = max_hp
# Controls whether entity can be controlled by player or computer
@export var is_player: bool = false 	
# Controls which team a player is on: 0 = player, 1 = enemy, 2 = allied (player), 3 = no team
@export var team: Team = Team.NONE

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


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass

func isDead() -> bool:
	return (hp <= 0)
