extends Node3D

func flush():
	$Flusher/FlusherAnimation.play("new_animation")
	%FlushSound.play()
