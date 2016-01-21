// Copyright (c) 2016 Richard Hawkins
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

module shapes()
{
    union() {
    translate([0.5, 1.5, -0.5])
    linear_extrude(2, center=false, convexity=10, twist=0)
    square(size=[3,1]);
        
    translate([1.5, 0.5, -0.5])
    linear_extrude(2, center=false, convexity=10, twist=0)
    square(size=[1,3]);
        
    translate([6.5, 6.5, -0.5])
    linear_extrude(2, center=false, convexity=10, twist=0)
    square(3);
        
    translate([2, 8.0, -0.5])
    linear_extrude(2, center=false, convexity=10, twist=0)
    circle(1.5, $fn=20);
        
    translate([6.5, 0.5, -0.5])
    linear_extrude(2, center=false, convexity=10, twist=0)
    polygon([[0,0],[3,0],[0,3]], paths=[[0,1,2]]);
    }
}

difference() {
    linear_extrude(0.5, center=false, convexity=10, twist=0)
    square(10);
    
    shapes();
}
