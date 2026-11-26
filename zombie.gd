extends CharacterBody2D
@export var speed: float = 85.0
@onready var damage_timer : Timer = $Timer

var player: Node2D

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")

func _physics_process(_delta: float) -> void:
	if player == null:
		return
		
	var direction  = global_position.direction_to(player.global_position)
	
	velocity = direction * speed
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		damage_timer.start()


func _on_timer_timeout() -> void:
	if player != null:
		player.take_damage(10.0)


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		damage_timer.stop()
