extends CharacterBody2D
@export var speed: float = 220.0
@export var max_health: float = 100.0
var current_health: float
signal health_changed(current_health: float, max_health: float)


func _ready() -> void:
	current_health = max_health

func take_damage(amount: float) -> void:
	current_health -= amount
	current_health = max(current_health, 0.0)
	health_changed.emit(current_health, max_health)
	print("Player health: ", current_health)
	
	if current_health <= 0:
		die()

func _physics_process(_delta: float) -> void:
	var direction := Vector2.ZERO
	
	direction.x = Input.get_axis("move_left", "move_right")
	direction.y = Input.get_axis("move_up", "move_down")
	
	direction = direction.normalized()
	
	velocity = direction * speed
	move_and_slide()

func die() -> void:
	print("Player has died")
