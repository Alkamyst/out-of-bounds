extends StaticBody3D

@onready var lock = $".."
@onready var door = $"../../.."
@onready var unlock_audio = %Audio_Unlock

func clicked():
	if Globals.got_key:
		door.open_door()
		unlock_audio.play()
		lock.queue_free()
