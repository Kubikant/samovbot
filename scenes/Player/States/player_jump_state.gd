extends State

@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"

var player: CharacterBody2D

func _ready():
	player = get_tree().get_first_node_in_group("Player")

func Enter():
	animation_player.play("Jump")
	
func Update():
	var direction := Input.get_axis("move_left", "move_right")
	
	if player.is_on_floor() and direction != 0:
		state_transition.emit("Walk")
	if player.is_on_floor() and direction == 0:
		state_transition.emit("Idle")
		
func _process(delta: float) -> void:
	if !player.is_on_floor():
		animation_player.play("Jump")
	
		
