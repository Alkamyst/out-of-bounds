extends StaticBody3D

var pos = 0
@onready var hand = $".."
@onready var clock = $"../../../.."
@export var pos_needed = 0


func clicked():
	if clock.can_interact:
		pos += 1
		if pos >= 12:
			pos = 0
		hand.rotation_degrees.y = 30 * pos
		$"../../../../Audio_Turn".play()
