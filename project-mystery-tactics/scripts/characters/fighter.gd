extends Character

class_name Fighter

const FIGHTER_ATK_TYPE = DamageType.PHYS
# default stats, can be modified
@export var FIGHTER_ATK = 7
@export var FIGHTER_DEF = 4
@export var FIGHTER_RES = 2
@export var FIGHTER_SPD = 7
@export var FIGHTER_MOV = 6

# fighter sprite data
const PLAYER_FIGHTER_SPRITE = "res://resources/fighter.png"
const ENEMY_FIGHTER_SPRITE = "res://resources/fighter_red.png"

func _init() -> void:
	# Rewrite stats for this subclass
	ATK_TYPE = FIGHTER_ATK_TYPE
	ATK = FIGHTER_ATK
	DEF = FIGHTER_DEF
	RES = FIGHTER_RES
	SPD = FIGHTER_SPD
	MOV = FIGHTER_MOV
	
	char_name = "Fighter"
	super()

func _ready() -> void:
	super()
	if(team == Team.ENEMY):
		sprite_name = ENEMY_FIGHTER_SPRITE
	else:
		sprite_name = PLAYER_FIGHTER_SPRITE
	loadSprite()
