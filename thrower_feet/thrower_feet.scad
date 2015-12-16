// Copyright (c) 2015 Richard Hawkins
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
// implied.
// See the License for the specific language governing permissions and
// limitations under the License.

// Constants for making adjustments to the feet.
l = 32.0;
w = 9.0;
h = 32.0;
iw = 2.0;

tie_size = 8.0;
tie_wall = 3.0;
tie_height = 4.0;


// TODO: Make the tie-down feet not extend to the bottom of the foot.
// TODO: Make the slot that holds the thrower's foot conform to the shape of the foot.

    
module tie(x=0.0, y=0.0, r=0.0)
{
    
    translate([x, y, 0.0])
    rotate([0.0, 0.0, r])
    difference()
    {
        cylinder(h, tie_size, tie_size);
        translate([0.0, -tie_size, -1.0])
        cube([tie_size, tie_size*2, h+2]);
   
        difference()
        {
            translate([0.0, 0.0, -1.0])
            cylinder(h+2.0, tie_size-tie_wall, tie_size-tie_wall);
        } 
    } 
};

module corner(x=0.0, y=0.0, r=0.0)
{
    translate([x, y, 0.0])
    rotate([0.0, 0.0, r])
    linear_extrude(h, center=false, convexity=10, twist=0)
    polygon(
        [[0,0],
         [0,iw],
         [iw,iw]],
        [[0,1,2,3]]);
}

union() {
// Foot
difference()
{
    linear_extrude(h, center=false, convexity=10, twist=0)
    polygon(
        [[0,0],
         [0,l],
         [w,l],
         [w,w+iw],
         [w+iw,w],
         [l,w],
         [l,0]],
        [[0,1,2,3,4,5,6]]);

    translate([0.0, 0.0, iw])
    linear_extrude(h, center=false, convexity=10, twist=0)
    polygon(
        [[iw,iw],
         [iw,l-iw],
         [w-iw,l-iw],
         [w-iw,w-iw],
         [l-iw,w-iw],
         [l-iw,iw]],
        [[0,1,2,3,4,5]]);
}

// Left tie
tie(x=0.0, y=l-iw*4);
corner(x=-1.0, y=(l/2)+0.2, r=-90);
tie(x=w, y=l-iw*4, r=180);
corner(x=w, y=(l/2)-1.0, r=-0);

// Right tie
tie(x=l-iw*4, y=w, r=-90);
corner(x=l/2.0+0.2, y=w+1.0, r=-180);
tie(x=l-iw*4, y=0, r=90.0);
corner(x=l/2.0-1, y=-0.0, r=-90);
}
