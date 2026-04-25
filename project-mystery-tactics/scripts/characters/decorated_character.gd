extends Character

class_name DecoratedCharacter

var myself: Character
var item: Item

func _init(me: Character, my_item: Item) -> void:
	self.myself = me
	self.item = my_item
	
	match self.item.item_type:
		Item.ItemType.Consumable:
			pass
		Item.ItemType.Weapon:
			myself.ATK = myself.ATK + self.item.item_value
		Item.ItemType.Armor:
			myself.DEF = myself.DEF + self.item.item_value
			myself.RES = myself.RES + self.item.item_value

func fight(target: Character) -> void:
	myself.fight(target)
	
func isDead() -> bool:
	return myself.isDead()
