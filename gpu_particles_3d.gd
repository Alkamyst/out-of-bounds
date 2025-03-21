extends GPUParticles3D


func start_rain():
	emitting = true

func _process(delta):
	if Globals.rain:
		start_rain()
