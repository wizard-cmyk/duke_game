class_name AddMapAsChild extends Command

const NAME: String = "Add Map as Child"

var width: float = 0.0
var create_current_map_object_cmd: CreateMap = CreateMap.new()
var current_map_object: MapObject = MapObject.new()

func _init(_width: float) -> void:
	name = NAME
	
	width = _width

func _execute_helper() -> void:
	create_current_map_object_cmd = CreateMap.new(width)
	create_current_map_object_cmd.execute()
	
	current_map_object = create_current_map_object_cmd.result
	result = current_map_object
