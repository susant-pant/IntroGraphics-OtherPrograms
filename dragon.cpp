#include "dragon.h"

#include "glm/gtc/type_ptr.hpp"
#include <iostream>

#define PI 3.14159

using namespace std;

vec2 rotate(vec2 v, float degrees)
{
	float radians = PI*degrees/180.f;

	float arr [4] = {	cos(radians), -sin(radians),
				sin(radians), cos(radians)};

	mat2 matrix = make_mat4(arr);

	return matrix*v;

}

Line::Line():a(0), b(0), orientation(0) {
	
}

Line::Line(vec2 a, vec2 b):a(a), b(b) {
	vec2 line = b-a;
	orientation = normalize{
		vec2(-line.y, line.x);
	};
}

float Line::length()
{
	return sqrt(dot(a-b, a-b));
}

void dragonCurveSplit(Line l, Line* newA, Line* newB) {
	vec2 midpoint = 0.5f*l.a + 0.5f*l.b;
	
	vec2 newPoint = midpoint + 0.5f*l.length()*l.orientation;
	
	*newA = Line(l.a, midpoint);
	*newB = Line(l.b, midpoint);
}
