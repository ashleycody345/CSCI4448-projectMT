extends TileMapLayer

var children: Array[Character]

func _ready() -> void:
	var all_children = self.get_children()
	for child in all_children:
		if(child is Character): children.append(child)
	print("total characters: " + str(children.size()))
	
func _process(delta: float) -> void:
	for character in children:
		set_map_pos(character)
		
func set_map_pos(character: Character) -> void:
	print(character.char_name + " position: " + str(character.map_pos.x) + ", " + str(character.map_pos.y))
	character.position = map_to_local(character.map_pos)
