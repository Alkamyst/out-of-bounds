extends WorldEnvironment


func change_fog():
	environment.volumetric_fog_density = lerp(environment.volumetric_fog_density, 0.05, 0.005)

func _process(delta):
	if Globals.rain:
		change_fog()
