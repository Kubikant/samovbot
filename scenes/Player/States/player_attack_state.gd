extends State

@onready var sprite_2d: Sprite2D = $"../../Sprite2D"
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var hitbox: CollisionShape2D = $"../../Sprite2D/HitBox/CollisionShape2D"

func Enter():

	if sprite_2d.flip_h == true:
		hitbox.position.x =  -6
	elif sprite_2d.flip_h == false:
		hitbox.position.x = 6

	animation_player.play("Attack")
	hitbox.disabled = false
	await animation_player.animation_finished
	hitbox.disabled = true
	state_transition.emit("Idle")

func Update():
	pass
