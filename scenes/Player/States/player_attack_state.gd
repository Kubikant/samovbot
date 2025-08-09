extends State

@onready var animated_sprite: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var hitbox: CollisionShape2D = $"../../AnimatedSprite2D/HitBox/CollisionShape2D"



func Enter():

	if animated_sprite.flip_h == true:
		hitbox.position.x =  -6
	elif animated_sprite.flip_h == false:
		hitbox.position.x = 6

	animated_sprite.play("Attack")
	hitbox.disabled = false
	await animated_sprite.animation_finished
	hitbox.disabled = true
	state_transition.emit("Idle")

func Update():
	pass
