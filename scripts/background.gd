extends ParallaxBackground

@onready var parallax_layer_6: ParallaxLayer = $ParallaxLayer6
@onready var parallax_layer_5: ParallaxLayer = $ParallaxLayer5

func _process(delta: float) -> void:
	parallax_layer_6.motion_offset.x -= 15*delta
	parallax_layer_5.motion_offset.x += 12*delta
