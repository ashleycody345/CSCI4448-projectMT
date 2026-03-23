extends Character

const MAGE_ATK_TYPE = DamageType.MAG
# default stats, can be modified
@export var MAGE_ATK = 8
@export var MAGE_DEF = 2
@export var MAGE_RES = 4
@export var MAGE_SPD = 5

func _ready() -> void:
	# Rewrite stats for this subclass
	ATK_TYPE = MAGE_ATK_TYPE
	ATK = MAGE_ATK
	DEF = MAGE_DEF
	RES = MAGE_RES
	SPD = MAGE_SPD
