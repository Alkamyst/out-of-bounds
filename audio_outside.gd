extends AudioStreamPlayer

@onready var otherAudio = $"../AudioPrison"

var active: bool = false
var maxVolume = -20.0

func _process(delta):
	if active:
		volume_db = lerp(volume_db, maxVolume, 0.1)
	else:
		volume_db = lerp(volume_db, -40.0, 0.1)

	if volume_db == -40.0:
		stop()

func _on_outside_area_3d_body_entered(body):
	if body.is_in_group("Player"):
		active = true
		Globals.is_outside = true
		otherAudio.active = false
		play()
