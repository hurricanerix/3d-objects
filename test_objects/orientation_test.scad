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
    translate([2, 5, -0.5])
    linear_extrude(2, center=false, convexity=10, twist=0)
    square(size=[15,2]);
        
    translate([5, 2, -0.5])
    linear_extrude(2, center=false, convexity=10, twist=0)
    square(size=[2,15]);
        
    translate([23, 23, -0.5])
    linear_extrude(2, center=false, convexity=10, twist=0)
    square(15);
        
    translate([9, 31.0, -0.5])
    linear_extrude(2, center=false, convexity=10, twist=0)
    circle(d=15, $fn=20);
        
    translate([23, 2, -0.5])
    linear_extrude(2, center=false, convexity=10, twist=0)
    polygon([[0,0],[15,0],[0,15]], paths=[[0,1,2]]);
    }
}

difference() {
    linear_extrude(1, center=false, convexity=10, twist=0)
    square(40);
    
    shapes();
}
