extends Character

class_name Mage

const MAGE_ATK_TYPE = DamageType.MAG
# default stats, can be modified
@export var MAGE_ATK = 8
@export var MAGE_DEF = 2
@export var MAGE_RES = 4
@export var MAGE_SPD = 5
@export var MAGE_MOV = 5

# mage sprite data
const PLAYER_MAGE_SPRITE = "res://resources/mage.png"
const ENEMY_MAGE_SPRITE = "res://resources/mage_red.png"

func _init() -> void:
	# Rewrite stats for this subclass
	ATK_TYPE = MAGE_ATK_TYPE
	ATK = MAGE_ATK
	DEF = MAGE_DEF
	RES = MAGE_RES
	SPD = MAGE_SPD
	MOV = MAGE_MOV
	
	char_name = "Mage"
	super()

func _ready() -> void:
	super()
	if(team == Team.ENEMY):
		sprite_name = ENEMY_MAGE_SPRITE
	else:
		sprite_name = PLAYER_MAGE_SPRITE
	loadSprite()
