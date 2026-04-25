extends Node

class_name CharacterBuilder

var character: Character

func _init() -> void:
	character = Character.new()
	
func set_atk(atk: int) -> CharacterBuilder:
	character.ATK = atk
	return self
	
func set_def(def: int) -> CharacterBuilder:
	character.DEF = def
	return self
	
func set_res(res: int) -> CharacterBuilder:
	character.RES = res
	return self

func set_spd(spd: int) -> CharacterBuilder:
	character.SPD = spd
	return self

func set_mov(mov: int) -> CharacterBuilder:
	character.MOV = mov
	return self

func set_char_name(new_name: String) -> CharacterBuilder:
	character.char_name = new_name
	return self

func set_item(item: Item) -> CharacterBuilder:
	character = DecoratedCharacter.new(character, item)
	return self

func build() -> Character:
	return character
