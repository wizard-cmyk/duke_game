class_name Data extends Resource

var dict: Dictionary = {}

func copy_data(_data: Data) -> void:
	dict.assign(_data.dict)
