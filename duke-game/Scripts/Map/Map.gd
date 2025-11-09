class_name MapManager extends Node2D

const UP: String = "ui_up"
const DOWN: String = "ui_down"
const CHANGE_RATE: float = 1.0

@export var base_map_width: float = float(G.DEFAULT_MAP_WIDTH)

var map: Map = null

var up_input: bool = false
var down_input: bool = false

var map_width_at_start_of_frame: float = 0.0
var map_width_at_end_of_frame: float = 0.0

class CellSprite extends Sprite2D:
	func _init(_resource: Texture2D, parent: Node) -> void:
		centered = false
		texture = _resource
		parent.add_child(self)

class MapCell extends Node2D:
	var cell_position: Vector2 = Vector2.ZERO
	var contains_monster: bool = false
	func _init(_has_monster: bool = true) -> void:
		contains_monster = _has_monster
		CellSprite.new(SpriteInfo.grid_resource, self)
		match contains_monster:
			true:
				CellSprite.new(SpriteInfo.monster_resource, self)
			_:
				pass

class Map extends Node2D:
	var map_cell_array: Array[MapCell] = []
	var map_object_width: float = 0.0
	var map_size: float = 0.0
	func _init(_new_map_width: float = float(G.DEFAULT_MAP_WIDTH)) -> void:
		map_object_width = _new_map_width
		map_size = calculate_map_size_from_width(map_object_width)
	func calculate_map_size_from_width(_map_width: float = map_object_width, _shape: float = float(G.MAP_SHAPE)) -> float:
		var _map_size: float = pow(_map_width, _shape)
		return _map_size

func generate_map_cell(_current_position: float, _map: Map) -> MapCell:
	var _new_map_cell: MapCell = null
	_new_map_cell = MapCell.new()
	_new_map_cell.cell_position = find_map_coordinates(_current_position, _map)
	return _new_map_cell

func find_map_coordinates(_map_position: float, _map: Map) -> Vector2:
	var _x: float = 0.0
	var _y: float = 0.0
	var _map_width: float = _map.map_object_width
	var _vector_to_return: Vector2 = Vector2.ZERO
	match _map_width:
		0.0:
			_y = (_map_position - _x) / G.DEFAULT_MAP_WIDTH
		_:
			_x = int(_map_position) % int(_map_width)
			_y = (_map_position - _x) / _map_width
	_vector_to_return = Vector2(_x, _y)
	return _vector_to_return

func append_cells_to_map_cell_array(_map: Map) -> bool:
	var _cell_to_append: MapCell = null
	var _array_to_append_to: Array[MapCell] = _map.map_cell_array
	var _map_size: float =  _map.map_size
	for current_position in int(_map_size):
		_cell_to_append = generate_map_cell(current_position, _map)
		_array_to_append_to.append(_cell_to_append)
	return G.SUCCESS

func copy_map_cell(_map_position: float, _map: Map) -> MapCell:
	var _copy_cell: MapCell = null
	var _map_cell_array: Array[MapCell] = _map.map_cell_array
	_copy_cell = _map_cell_array.get(int(_map_position))
	return _copy_cell

func copy_map_cell_vector2(_map_position: Vector2, _map: Map) -> MapCell:
	var _sum_of_map_position_vector: float = 0.0
	var _map_width: float = float(_map.map_object_width)
	_sum_of_map_position_vector = _map_position.x + (_map_position.y * _map_width) 
	return copy_map_cell(_sum_of_map_position_vector, _map)

func add_map_cells_as_children(_map: Map, _grid_size: float = float(G.SPRITE_GRID_SIZE)) -> bool:
	var _array_to_add_children_from: Array[MapCell] = _map.map_cell_array
	var _map_cell_to_add_as_child: MapCell = null
	var _array_size: = _array_to_add_children_from.size()
	for index_of_child in _array_size:
		_map_cell_to_add_as_child = copy_map_cell(index_of_child, _map)
		_map_cell_to_add_as_child.position = _map_cell_to_add_as_child.cell_position * _grid_size
		_map.add_child(_map_cell_to_add_as_child)
	return G.SUCCESS

func create_new_map_object(_width: float = float(G.DEFAULT_MAP_WIDTH)) -> Map:
	var _new_map: Map = Map.new(_width)
	append_cells_to_map_cell_array(_new_map)
	add_map_cells_as_children(_new_map)
	return _new_map

func add_map_child(_map_width: float = float(base_map_width), parent: Node = self) -> Map:
	var _new_map_object: Map = create_new_map_object(_map_width)
	parent.add_child(_new_map_object)
	return _new_map_object

func destroy_map(_map_to_destroy: Map) -> bool:
	match _map_to_destroy:
		null:
			return G.FAIL
		_:
			_map_to_destroy.queue_free()
			return G.SUCCESS

func _ready() -> void:
	map = add_map_child()

func _process(_delta: float) -> void:
	map_width_at_start_of_frame = base_map_width
	up_input = Input.is_action_just_pressed(UP)
	down_input = Input.is_action_just_pressed(DOWN)
	
	if up_input:
		base_map_width += CHANGE_RATE
	if down_input:
		base_map_width -= CHANGE_RATE
	
	map_width_at_end_of_frame = base_map_width
	
	if map_width_at_start_of_frame != map_width_at_end_of_frame:
		destroy_map(map)
		map = add_map_child()
