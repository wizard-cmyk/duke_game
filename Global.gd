# Global
extends Node

const UP: String = "ui_up"
const DOWN: String = "ui_down"
const RIGHT: String = "ui_right"
const LEFT: String = "ui_left"
const ENTER: String = "ui_accept"

const CHANGE_RATE: Vector2i = Vector2(1, 1)
const SPRITE_GRID_SIZE: int = 256
const DEFAULT_MAP_WIDTH: int = 4
const DEFAULT_MAP_LENGTH: int = 4
const DEFAULT_MAP_SIZE: Vector2i = Vector2i(DEFAULT_MAP_WIDTH, DEFAULT_MAP_LENGTH)

const GRID_SPRITE: String = "res://Sprites/grid_element.png"
const MONSTER_SPRITE: String = "res://Sprites/monster.png"
const KNIGHT_SPRITE: String = "res://Sprites/knight.png"
