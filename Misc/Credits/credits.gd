extends Control


func _on_rain_timer_timeout() -> void:
	$AnimationPlayer.play("new_animation")
