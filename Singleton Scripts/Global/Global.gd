# G (short for Global)
extends Node

const UP: String = "ui_up"
const DOWN: String = "ui_down"
const ENTER: String = "ui_accept"
const CHANGE_RATE: float = 1.0

const SPRITE_GRID_SIZE: int = 64
const MAP_CELL_MULTIPLIER: int = 2
const DEFAULT_MAP_WIDTH: int = 4

const MAP_SHAPE: int = 2

const SUCCESS: bool = true
const FAIL: bool = false

const GRID_SPRITE: String = "res://Sprites/Grid/grid_element.png"
const MONSTER_SPRITE: String = "res://Sprites/Monster/monster.png"
const KNIGHT_SPRITE: String = "res://Sprites/Knight/knight.png"

const DEFAULT_POSITION_INT: int = 0
const DEFAULT_POSITION_VEC: Vector2 = Vector2.ZERO

enum DELETE_MODE { ALL, NEXT, DIRECT }
const ALL: DELETE_MODE = DELETE_MODE.ALL
const NEXT: DELETE_MODE = DELETE_MODE.NEXT
const DIRECT: DELETE_MODE = DELETE_MODE.DIRECT

var cell_default: CellData = CellData.new(Vector2.ZERO, true, true)
