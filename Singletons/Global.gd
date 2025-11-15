# Global
extends Node

##

var default_map_data: MapData = MapData.new([],[], DEFAULT_MAP_SIZE, false, true)

##

const UP: String = "ui_up"
const DOWN: String = "ui_down"
const RIGHT: String = "ui_right"
const LEFT: String = "ui_left"
const ENTER: String = "ui_accept"

##

const CHANGE_RATE: float = 1.0

const SPRITE_GRID_SIZE: int = 256

const DEFAULT_MAP_WIDTH: int = 4
const DEFAULT_MAP_LENGTH: int = 4
const DEFAULT_MAP_SIZE: Vector2 = Vector2(DEFAULT_MAP_WIDTH, DEFAULT_MAP_LENGTH)

const MAP_CELL_MULTIPLIER: int = 2

const MAP_SHAPE: int = 2

##

const SPRITE_PATH: String = "res://Sprites/"
const SPRITE_EXTENSION: String = ".png"

const GRID_SPRITE: String = SPRITE_PATH + "Grid/grid_element" + SPRITE_EXTENSION
const MONSTER_SPRITE: String = SPRITE_PATH + "Monster/monster" + SPRITE_EXTENSION
const KNIGHT_SPRITE: String = SPRITE_PATH + "Knight/knight" + SPRITE_EXTENSION

##


##
