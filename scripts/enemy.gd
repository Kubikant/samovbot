extends Node2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var enemy: Node2D = $"."

@export var MAX_HEALTH := 40
var health

func _ready() -> void:
	animated_sprite.play("Idle")
	health = MAX_HEALTH
	
func _process(_delta: float) -> void:
	if health <= 0:
		queue_free()


func take_damage(amount: int) -> void:
	health -= amount
	print(-amount)
