extends TileMapLayer

var children: Array[Character]
var selected_unit: Character = null

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
	# child selection
	var child_hovered_over: Character = select_child_hovered_over()
	if(child_hovered_over == null): return
	
	if(Input.is_action_just_pressed("mouse_left_click")):
		selected_unit = child_hovered_over
		print("selected unit: " + selected_unit.char_name)

func set_map_pos(character: Character) -> void:
	#print(character.char_name + " position: " + str(character.map_pos.x) + ", " + str(character.map_pos.y))
	character.position = map_to_local(character.map_pos)

func select_child_hovered_over() -> Character:
	var map_tile_hovered: Vector2i = local_to_map(get_local_mouse_position())
	var char_hovered: Character
	var char_name: String 
	for child in children:
		if(child.map_pos == map_tile_hovered):
			char_hovered = child
			break
	return char_hovered
