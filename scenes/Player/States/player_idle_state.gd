extends State

@onready var animated_sprite: AnimatedSprite2D = $"../../AnimatedSprite2D"

func Enter():
	animated_sprite.play("Idle")
	
func Update():
	
	
	if Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right"):
		state_transition.emit("Walk")
	
	if Input.is_action_just_pressed("jump"):
		state_transition.emit("Jump")
		
	if Input.is_action_just_pressed("Attack"):
		state_transition.emit("Attack")
	
