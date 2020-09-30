//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 offset;
uniform float strength;
uniform float size;
uniform sampler2D grainTexture;

void main(){
	// Normalize the offset value and mix that resulting texel with the current fragment
	vec2 texelOffset = normalize(offset);
	vec3 offsetColor = texture2D(grainTexture, fract((v_vTexcoord + texelOffset) * size)).rgb;
	// Send the calculated color off for rendering
    gl_FragColor = v_vColour * vec4(offsetColor, strength);
}
