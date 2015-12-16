OPENSCAD="/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD"

default: thrower_feet/thrower_feet.stl

thrower_feet/thrower_feet.stl: thrower_feet/thrower_feet.scad
	$(OPENSCAD) -o thrower_feet/thrower_feet.stl -D 'quality="production"' thrower_feet/thrower_feet.scad
