extends Node3D

@export var bullet_base: PackedScene

var bullet_sprite
@export var bullet_speed = 100.0
var bullet_instance

@export var lines_count = 1
@export var lines_gap = 1.0
@export var lines_offset = 0.0
@export var lines_offset_per_shot = 0.0

"""
func _get_property_list() -> Array:
	var properties = []
	properties.append({
		name = "bullet",
		type = TYPE_NIL,
		hint_string = "bullet_",
		usage = PROPERTY_USAGE_GROUP
	})
	properties.append({
		name = "bullet_base",
		type = TYPE_OBJECT,
		hint = PROPERTY_HINT_RESOURCE_TYPE,
		hint_string = "PackedScene",
		usage = PROPERTY_USAGE_EDITOR | PROPERTY_USAGE_SCRIPT_VARIABLE
	})
	properties.append({
		name = "bullet_sprite",
		type = TYPE_OBJECT,
		hint = PROPERTY_HINT_RESOURCE_TYPE,
		hint_string = "Texture2D",
		usage = PROPERTY_USAGE_EDITOR | PROPERTY_USAGE_SCRIPT_VARIABLE
	})
	properties.append({
		name = "bullet_speed",
		type = TYPE_FLOAT,
		usage = PROPERTY_USAGE_EDITOR | PROPERTY_USAGE_SCRIPT_VARIABLE
	})
	properties.append({
		name = "lines_of_bullets",
		type = TYPE_NIL,
		hint_string = "lines_",
		usage = PROPERTY_USAGE_GROUP
	})
	properties.append({
		name = "lines_count",
		type = TYPE_INT,
		usage = PROPERTY_USAGE_EDITOR | PROPERTY_USAGE_SCRIPT_VARIABLE
	})
	properties.append({
		name = "lines_gap",
		type = TYPE_FLOAT,
		hint = PROPERTY_HINT_RANGE,
		hint_string = "0.0, 1.0",
		usage = PROPERTY_USAGE_EDITOR | PROPERTY_USAGE_SCRIPT_VARIABLE
	})
	properties.append({
		name = "lines_offset",
		type = TYPE_FLOAT,
		hint = PROPERTY_HINT_RANGE,
		hint_string = "0.0, 3.14",
		usage = PROPERTY_USAGE_EDITOR | PROPERTY_USAGE_SCRIPT_VARIABLE
	})
	properties.append({
		name = "lines_offset_per_shot",
		type = TYPE_FLOAT,
		usage = PROPERTY_USAGE_EDITOR | PROPERTY_USAGE_SCRIPT_VARIABLE
	})
	return properties
"""

func _ready():
	bullet_instance = bullet_base.instantiate()

func _on_Timer_timeout():
	var gap = (PI*2/lines_count)*lines_gap
	for i in range(lines_count):
		var bul = bullet_instance.duplicate()
		var bullet_angle = (gap*i)+lines_offset
		bul.velocity.x = cos(bullet_angle)
		bul.velocity.y = sin(bullet_angle)
		#bul.position = position
		bul.speed = bullet_speed
		get_tree().get_root().add_child(bul)
	lines_offset += lines_offset_per_shot
	if lines_offset > PI*2:
		lines_offset -= PI*2
