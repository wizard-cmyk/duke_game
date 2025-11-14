# G (short for Global)
extends Node

const UP: String = "ui_up"
const DOWN: String = "ui_down"
const RIGHT: String = "ui_right"
const LEFT: String = "ui_left"
const ENTER: String = "ui_accept"
const CHANGE_RATE: float = 1.0

const SPRITE_GRID_SIZE: int = 64
const MAP_CELL_MULTIPLIER: int = 2
const DEFAULT_MAP_WIDTH: int = 4
const DEFAULT_MAP_LENGTH: int = 4

const MAP_SHAPE: int = 2

const SUCCESS: bool = true
const FAIL: bool = false

const SPRITE_PATH: String = "res://Sprites/"
const SPRITE_EXTENSION: String = ".png"

const GRID_SPRITE: String = SPRITE_PATH + "Grid/grid_element" + SPRITE_EXTENSION
const MONSTER_SPRITE: String = SPRITE_PATH + "Monster/monster" + SPRITE_EXTENSION
const KNIGHT_SPRITE: String = SPRITE_PATH + "Knight/knight" + SPRITE_EXTENSION

const DEFAULT_POSITION_INT: int = 0
const DEFAULT_POSITION_VEC: Vector2 = Vector2.ZERO

enum DELETE_MODE { ALL, NEXT, DIRECT }
const ALL: DELETE_MODE = DELETE_MODE.ALL
const NEXT: DELETE_MODE = DELETE_MODE.NEXT
const DIRECT: DELETE_MODE = DELETE_MODE.DIRECT
