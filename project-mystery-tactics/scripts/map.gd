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
	process_input()

func process_input() -> void:
	if(children.size() > 0):
		if(Input.is_action_just_pressed("debug_left")): children[0].map_pos.x -= 1
		if(Input.is_action_just_pressed("debug_right")): children[0].map_pos.x += 1
		if(Input.is_action_just_pressed("debug_down")): children[0].map_pos.y += 1
		if(Input.is_action_just_pressed("debug_up")): children[0].map_pos.y -= 1

func set_map_pos(character: Character) -> void:
	print(character.char_name + " position: " + str(character.map_pos.x) + ", " + str(character.map_pos.y))
	character.position = map_to_local(character.map_pos)
