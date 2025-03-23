extends Area2D

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Click"):
		if $"../Control2/Start/PanelContainer/Selection1".visible:
			var tween = create_tween()
			tween.tween_interval(0)
			tween.tween_callback(
				get_tree().change_scene_to_file.bind("res://game.tscn")
			)

func _on_mouse_entered() -> void:
	$"../Control2/Start/PanelContainer/Selection1".visible = true


func _on_mouse_exited() -> void:
	$"../Control2/Start/PanelContainer/Selection1".visible = false
