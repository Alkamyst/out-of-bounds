extends Node3D

@onready var animation: AnimationPlayer = $AnimationPlayer
var moved: bool = false

func moveWall():
	animation.play("move")
	moved = true


func _on_completion_area_3d_body_entered(body):
	if body.is_in_group("Player"):
		if not moved:
			moveWall()
