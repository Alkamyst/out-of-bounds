extends StaticBody3D

var can_flush: bool = true

func clicked():
	if can_flush:
		$"../FlusherAnimation".play("new_animation")
		can_flush = false

func enable_flush():
	can_flush = true
