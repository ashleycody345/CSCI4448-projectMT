extends Character

class_name Defender

const DEFENDER_ATK_TYPE = DamageType.PHYS
# default stats, can be modified
@export var DEFENDER_ATK = 4
@export var DEFENDER_DEF = 6
@export var DEFENDER_RES = 4
@export var DEFENDER_SPD = 3
@export var DEFENDER_MOV = 3

# defender sprite data
const PLAYER_DEFENDER_SPRITE = "res://resources/defender.png"
const ENEMY_DEFENDER_SPRITE = "res://resources/defender_red.png"

func _init() -> void:
	# Rewrite stats for this subclass
	ATK_TYPE = DEFENDER_ATK_TYPE
	ATK = DEFENDER_ATK
	DEF = DEFENDER_DEF
	RES = DEFENDER_RES
	SPD = DEFENDER_SPD
	MOV = DEFENDER_MOV
	
	char_name = "Defender"
	super()

func _ready() -> void:
	super()
	if(team == Team.ENEMY):
		sprite_name = ENEMY_DEFENDER_SPRITE
	else:
		sprite_name = PLAYER_DEFENDER_SPRITE
	loadSprite()
