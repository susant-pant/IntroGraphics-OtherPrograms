// ==========================================================================
// Vertex program for barebones GLFW boilerplate
//
// Author:  Sonny Chan, University of Calgary
// Date:    December 2015
// ==========================================================================
#version 410

// interpolated colour received from vertex stage
in vec2 uv;
in vec2 pos;

// first output is mapped to the framebuffer's colour index by default
out vec4 FragmentColour;

uniform vec2 mousePos;

void main(void)
{
	vec2 mouseDisp = (mousePos - 0.5f) * 2.f;
	float u = sqrt(pow((pos.x - mouseDisp.x),2) + pow((pos.y + mouseDisp.y),2));
	vec3 color = vec3(1.f, 1.f, 1.f) * pow((1-u),1) + vec3(1.f, 0.3f, 0.f) * 4 * u * (1-u) + vec3(0.f, 0.f, 0.f) * pow(u,5);
	if (u < 0.2f)
		color = vec3(0.f, 0.f, 0.f);
	FragmentColour = vec4(color, 1);
}
