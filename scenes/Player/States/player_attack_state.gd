extends State

@onready var animated_sprite: AnimatedSprite2D = $"../../AnimatedSprite2D"

func Enter():
	animated_sprite.play("Attack")
	await animated_sprite.animation_finished
	state_transition.emit("Idle")

func Update():
	pass
