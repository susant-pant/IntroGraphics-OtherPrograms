#version 410
layout(isolines) in;

in vec3 teColour[];
//in gl_in[];

out vec3 Colour;

uniform sampler2D heightmap;

void main()
{
	float u = gl_TessCoord.x;
	float v = gl_TessCoord.y;

	vec3 startColor = vec3(0.0, 0.0, 0.0);
	vec3 endColor = vec3(1,1,1);

	float b0 = 1.0-u;
	float b1 = u;
	
	float c0 = 1.0 - v;
	float c1 = v;

	gl_Position = b0*gl_in[0].gl_Position +
					b1*gl_in[1].gl_Position;
					
	//gl_Position += (3*v + (1-v)*(1 - texture(heightmap, vec2(u, v)).r))*vec4(0,0.25,0,0);
	gl_Position += (3*v + (1-v) * texture(heightmap, vec2(u, v)).r) * vec4(0,0.25,0,0);
	//gl_Position += texture(heightmap, vec2(u, 0.5)).r * vec4(0,1,0,0);
	
	Colour = pow(c0,2)*startColor + 2*c0 * c1* teColour[1] + pow(c1,2)*endColor;

}
