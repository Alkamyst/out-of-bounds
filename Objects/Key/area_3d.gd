extends StaticBody3D

@onready var key = $".."

func clicked():
	key.queue_free()
	Globals.got_key = true
