extends Node2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var enemy: Node2D = $"."
@onready var health_bar: Label = $Health

@export var MAX_HEALTH := 40
var health

func _ready() -> void:
	animated_sprite.play("Idle")
	health = MAX_HEALTH
	health_bar.text = str(MAX_HEALTH)
	
func _process(_delta: float) -> void:
	if health <= 0:
		queue_free()


func take_damage(amount: int) -> void:
	health -= amount
	health_bar.text = str(health)
	print(-amount)
