extends State

@export var animation_player: AnimationPlayer
@onready var weapon_sword: Node2D = $"../../WeaponSword"


func Enter():
	var animation_player = weapon_sword.get_node("AnimationPlayer") as AnimationPlayer
	animation_player.play("sword_attack")
	await animation_player.animation_finished
	animation_player.play("RESET")
	state_transition.emit("Idle")

func Update():
	pass
