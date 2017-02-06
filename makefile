OS_NAME:=$(shell uname -s)

ifeq ($(OS_NAME),Linux)
	LIBS += \
		-lGLEW \
		-lglfw \
		-lpthread \
		-lm \
		-lXi \
		-lXrandr \
		-lX11 \
		-lXxf86vm \
		-lXinerama \
		-lXcursor \
		-lGLU \
		-ldl \
		-lOpenGL
endif

target a.out: dragon.o
	g++ -std=c++11 main.cpp -Wall -Wpragmas $(LIBS) dragon.o -o a.out

dragon.o: dragon.cpp dragon.h
	g++ -std=c++11 -c dragon.cpp

clean:
	rm *.o a.out
