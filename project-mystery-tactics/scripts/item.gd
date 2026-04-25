extends Node2D

class_name Item


enum ItemType {
	# restores health based on value
	Consumable,
	# increase damage based on value
	Weapon,
	# decrease damage taken based on value
	Armor
}

@export var item_name: String
@export var item_type: ItemType
@export var item_value: int

func _init(my_name: String, my_type: ItemType, my_value: int) -> void:
	self.item_name = my_name
	self.item_type = my_type
	self.item_value = my_value

func _ready() -> void:
	pass
