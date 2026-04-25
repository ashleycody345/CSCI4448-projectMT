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
	process_input_select()
	
	


func process_input_select() -> void:
	# child selection
	var child_hovered_over: Character = select_child_hovered_over()
	if(child_hovered_over == null): return
	
	if(Input.is_action_just_pressed("mouse_left_click")):
		selected_unit = child_hovered_over
		print("selected unit: " + selected_unit.char_name)
		print("navigable tiles:")
		var navigable_tiles = get_navigable_tiles(selected_unit)
		for tile in navigable_tiles:
			print(str(tile.x) + ", " + str(tile.y))

func set_map_pos(character: Character) -> void:
	#print(character.char_name + " position: " + str(character.map_pos.x) + ", " + str(character.map_pos.y))
	character.position = map_to_local(character.map_pos)

func select_child_hovered_over() -> Character:
	var map_tile_hovered: Vector2i = local_to_map(get_local_mouse_position())
	var char_hovered: Character
	for child in children:
		if(child.map_pos == map_tile_hovered):
			char_hovered = child
			break
	return char_hovered

func can_navigate_tile(tile: Vector2i, layer: int = 0) -> bool:
	if(tile_contains_character(tile)): return false
	var tile_data: TileData = get_cell_tile_data(tile)
	if(tile_data == null): return false
	return tile_data.get_navigation_polygon(layer) != null

func tile_contains_character(tile: Vector2i) -> bool:
	for child in children:
		if(child.map_pos == tile): return true
	return false

func get_navigable_tiles(unit: Character) -> Array[Vector2i]:
	return get_navigable_tiles_start_pos(unit.map_pos, unit.MOV, true)

func get_navigable_tiles_start_pos(start_pos: Vector2i, mov: int, init: bool = false) -> Array[Vector2i]:
	var tiles: Array[Vector2i]
	# if current tile cannot be traversed, early return
	if((!can_navigate_tile(start_pos) && !init) || mov == 0): return tiles
	
	tiles.append(start_pos)
	var up: Vector2i = Vector2i(start_pos.x, start_pos.y - 1)
	var down: Vector2i = Vector2i(start_pos.x, start_pos.y + 1)
	var left: Vector2i = Vector2i(start_pos.x - 1, start_pos.y)
	var right: Vector2i = Vector2i(start_pos.x + 1, start_pos.y)
	
	if(!(up in tiles)):
		tiles.append_array(get_navigable_tiles_start_pos(up, mov - 1))
	if(!(down in tiles)):
		tiles.append_array(get_navigable_tiles_start_pos(down, mov - 1))
	if(!(left in tiles)):
		tiles.append_array(get_navigable_tiles_start_pos(left, mov - 1))
	if(!(right in tiles)):
		tiles.append_array(get_navigable_tiles_start_pos(right, mov - 1))
	return tiles
