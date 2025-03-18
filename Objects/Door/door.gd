extends Node3D

@onready var animation: AnimationPlayer = %AnimationPlayer
var is_closed: bool = false

func open_door():
	animation.play("open")

func close_door():
	animation.play("close")
	is_closed = true


func _on_area_3d_body_entered(body):
	if body.is_in_group("Player"):
		if not is_closed:
			close_door()
