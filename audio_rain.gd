extends AudioStreamPlayer

var maxVolume = -15.0
@onready var audioThunder: AudioStreamPlayer = %AudioThunder
@onready var rainTimer: Timer = %RainTimer
var thunderPlayed: bool = false

func _process(delta: float) -> void:
	if Globals.rain:
		volume_db = lerp(volume_db, maxVolume, 0.1)
		if not thunderPlayed:
			audioThunder.play()
			thunderPlayed = true
			rainTimer.start()
