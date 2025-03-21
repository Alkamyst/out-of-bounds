extends Node3D

@onready var animation: AnimationPlayer = $AnimationPlayer
var moved: bool = false

func moveWall():
	animation.play("move")
	moved = true

func _on_outside_area_3d_body_entered(body):
	if not moved and Globals.unlock_treasure:
		moveWall()
		
func rain():
	Globals.rain = true
