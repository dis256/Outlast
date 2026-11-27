shader_type canvas_item;
uniform float intensity : hint_range(0.0 , 1.0) = 0.0;
void fragment() {
	vec2 uv = UV;
	float distance_from_centre = length((uv - vec2(0.5))* vec2(1.0,1.0));
	float vignette = smoothstep(0.25, 0.85, distance_from_centre);
	float alpha = vignette * intensity * 0.75;
	COLOR = vec4(0.8,0.0,0.0, alpha);
}
