extends Node3D

func flush():
	$Toilet/Water/WaterAnimation.stop()
	$FlushAnimation.play("flush")
