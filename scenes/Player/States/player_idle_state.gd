extends State

@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"

func Enter():
	animation_player.play("Idle")
	
func Update():
	
	
	if Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right"):
		state_transition.emit("Walk")
	
	if Input.is_action_just_pressed("jump"):
		state_transition.emit("Jump")
		
	if Input.is_action_just_pressed("Attack"):
		state_transition.emit("Attack")
	
