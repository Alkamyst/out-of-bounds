extends Area2D

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Click"):
		if $"../Control2/Quit/PanelContainer2/Selection2".visible:
			get_tree().quit() 


func _on_mouse_entered() -> void:
	$"../Control2/Quit/PanelContainer2/Selection2".visible = true


func _on_mouse_exited() -> void:
	$"../Control2/Quit/PanelContainer2/Selection2".visible = false
