extends Character

class_name Cleric

const CLERIC_ATK_TYPE = DamageType.HEAL
# default stats, can be modified
@export var CLERIC_ATK = 6
@export var CLERIC_DEF = 2
@export var CLERIC_RES = 8
@export var CLERIC_SPD = 4
@export var CLERIC_MOV = 3

func _init() -> void:
	# Rewrite stats for this subclass
	ATK_TYPE = CLERIC_ATK_TYPE
	ATK = CLERIC_ATK
	DEF = CLERIC_DEF
	RES = CLERIC_RES
	SPD = CLERIC_SPD
	MOV = CLERIC_MOV
	
	char_name = "Cleric"
	super()
