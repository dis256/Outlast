extends CanvasLayer
@onready var health_bar: TextureProgressBar = $HealthBar
@onready var low_health_effect: ColorRect = $"Low health red effect thingy"
@onready var health_label: Label =$Health
var pulse_time: float = 0.0


func update_health(current_health: float, max_health: float) -> void:
	health_bar.max_value = max_health
	health_bar.value = current_health
	
	var health_percentage = current_health/max_health
	
	if health_percentage <= 0.5:
		low_health_effect.material.set_shader_parameter("intensity", (0.5 - health_percentage) * 2.0)
	else:
		low_health_effect.material.set_shader_parameter("intensity", 0.0)
	
	health_label.text = str(int(round(current_health))) + " / " + str(int(round(max_health)))

func _on_player_health_changed(current_health: float, max_health: float) -> void:
	update_health(current_health, max_health)

func  _process(delta: float) -> void:
	if low_health_effect == null:
		return
	if health_bar.value/ health_bar.max_value < 0.15:
		pulse_time += delta * 3.0
		var pulse = (sin(pulse_time)+1.0)/2.0
		
		low_health_effect.material.set_shader_parameter("intensity", 0.7 + pulse * 0.3)
	else:
		pulse_time = 0.0
		
		if health_bar.value / health_bar.max_value >=0.15:
			var health_percentage = health_bar.value / health_bar.max_value
			
			if health_percentage <= 0.5:
				low_health_effect.material.set_shader_parameter("intensity", (0.5 - health_percentage)*2.0)
			else:
				low_health_effect.material.set_shader_parameter("intensity", 0.0)
