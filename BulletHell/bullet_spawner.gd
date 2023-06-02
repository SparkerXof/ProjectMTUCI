extends Node3D

@export var bullet_base: PackedScene

var bullet_sprite
@export var bullet_speed = 100.0
var bullet_instance

@export var lines_count = 1
@export var lines_gap = 1.0
@export var lines_offset = 0.0
@export var lines_offset_per_shot = 0.0


func _ready():
	bullet_instance = bullet_base.instantiate()

func _on_Timer_timeout():
	var gap = (PI*2/lines_count)*lines_gap
	for i in range(lines_count):
		var bul = bullet_instance.duplicate()
		var bullet_angle = (gap*i)+lines_offset
		bul.position = position
		bul.velocity.x = cos(bullet_angle)
		bul.velocity.y = sin(bullet_angle)
		bul.speed = bullet_speed
		get_tree().get_root().add_child(bul)
	lines_offset += lines_offset_per_shot
	if lines_offset > PI*2:
		lines_offset -= PI*2
	lines_offset_per_shot += 0.005
