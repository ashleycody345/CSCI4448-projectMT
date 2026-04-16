extends Character

class_name Defender

const DEFENDER_ATK_TYPE = DamageType.PHYS
# default stats, can be modified
@export var DEFENDER_ATK = 4
@export var DEFENDER_DEF = 6
@export var DEFENDER_RES = 4
@export var DEFENDER_SPD = 3

func _init() -> void:
	# Rewrite stats for this subclass
	ATK_TYPE = DEFENDER_ATK_TYPE
	ATK = DEFENDER_ATK
	DEF = DEFENDER_DEF
	RES = DEFENDER_RES
	SPD = DEFENDER_SPD
	
	char_name = "Defender"
	super()
