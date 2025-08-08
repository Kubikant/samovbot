extends State

@onready var animated_sprite: AnimatedSprite2D = $"../../AnimatedSprite2D"
var player: CharacterBody2D

@export var SPEED = 90.0
@export var JUMP_VELOCITY = -220.0

func _ready():
	player = get_tree().get_first_node_in_group("Player")

func Enter():
	animated_sprite.play("Walk")
	
func Update():
	var direction := Input.get_axis("move_left", "move_right")
	
	if Input.is_action_just_pressed("jump"):
		state_transition.emit("Jump")
		
	if Input.is_action_just_pressed("Attack"):
		state_transition.emit("Attack")
		
	if direction == 0:
		state_transition.emit("Idle")
		

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not player.is_on_floor():
		player.velocity += player.get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and player.is_on_floor():
		player.velocity.y = JUMP_VELOCITY


	var direction := Input.get_axis("move_left", "move_right")
	
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
		
	
	if direction:
		player.velocity.x = direction * SPEED
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, SPEED)

	player.move_and_slide()
