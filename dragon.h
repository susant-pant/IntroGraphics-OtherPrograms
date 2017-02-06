#ifndef DRAGON_H
#define DRAGON_H
#include "glm/glm.hpp"



using namespace glm;

vec2 rotate(vec2 v, float degrees);

class Line {
	public:
	vec2 a,b, orientation;
	Line();
	Line(vec2 a, vec2 b);
	
	float length();
};

void dragonCurveSplit(Line l, Line* newA, Line* newB);

#endif
