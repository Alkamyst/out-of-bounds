extends StaticBody3D

@onready var lock = $".."
@onready var door = $"../../.."

func clicked():
	door.open_door()
	lock.queue_free()
