extends CanvasLayer
@onready var health_bar: ProgressBar = $ProgressBar

func update_health(current_health: float, max_health: float) -> void:
	health_bar.max_value = max_health
	health_bar.value = current_health

func _on_player_health_changed(current_health: float, max_health: float) -> void:
	update_health(current_health, max_health)
