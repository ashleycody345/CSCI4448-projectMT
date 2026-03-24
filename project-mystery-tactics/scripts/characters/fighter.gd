extends Character

class_name Fighter

const FIGHTER_ATK_TYPE = DamageType.PHYS
# default stats, can be modified
@export var FIGHTER_ATK = 7
@export var FIGHTER_DEF = 4
@export var FIGHTER_RES = 2
@export var FIGHTER_SPD = 7

func _init() -> void:
	# Rewrite stats for this subclass
	ATK_TYPE = FIGHTER_ATK_TYPE
	ATK = FIGHTER_ATK
	DEF = FIGHTER_DEF
	RES = FIGHTER_RES
	SPD = FIGHTER_SPD
	super()
