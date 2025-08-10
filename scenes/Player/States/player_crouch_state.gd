extends State

@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"

var in_bush: bool = false

func _process(_delta: float) -> void:
	if in_bush:
		if Input.is_action_pressed("crouch"):
			if animation_player.current_animation != "Crouch":
				animation_player.play("Crouch")
			state_transition.emit("Crouch")
		elif name == "Crouch":
			state_transition.emit("Idle")

func _on_bush_entered(_body: Node2D) -> void:
	in_bush = true

func _on_bush_exited(_body: Node2D) -> void:
	in_bush = false
	if name == "Crouch":
		state_transition.emit("Idle")
