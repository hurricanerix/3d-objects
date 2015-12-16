OPENSCAD="openscad"
ifneq ($(OS),Windows_NT)
	UNAME=$(shell uname -s)
	ifeq ($(UNAME),Darwin)
		OPENSCAD="/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD"
	endif
endif

default: thrower_feet/thrower_feet.stl

thrower_feet/thrower_feet.stl: thrower_feet/thrower_feet.scad
	$(OPENSCAD) -o thrower_feet/thrower_feet.stl -D 'quality="production"' thrower_feet/thrower_feet.scad
