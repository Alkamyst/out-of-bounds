extends StaticBody3D

@onready var hand = $".."
@onready var audio: AudioStreamPlayer3D = $"../../Audio_Grab"

func clicked():
	hand.queue_free()
	Globals.have_hand = true
	audio.play()
