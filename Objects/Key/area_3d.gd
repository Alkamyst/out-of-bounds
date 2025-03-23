extends StaticBody3D

@onready var key = $".."
@onready var audio: AudioStreamPlayer3D = $"../../Audio_Key_Grab"

func clicked():
	key.queue_free()
	Globals.got_key = true
	audio.play()
