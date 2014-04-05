// Author: Samuel El-Borai <samuel.elborai@gmail.com>
// Date: 05/04/2014
//
// Flat ring with sinusoidal decoration

difference() {
    union() {
        for(tetha = [0:1:360]){
            rotate([1, 0, tetha]){
                translate([8.7, 0, 2 * sin(10 * tetha)])
                rotate([90, 0, 0]) {
                    cylinder(h = 0.5, r = 0.5, center = true, $fn = 100);
                }
            }
        }

        rotate_extrude(convexity = 10, $fn = 100)
        translate([5, 3, 0])
        square([8, 1], true);

        rotate_extrude(convexity = 10, $fn = 100)
        translate([5, -3, 0])
        square([8, 1], true);

        rotate_extrude(convexity = 10, $fn = 100)
        translate([5, 0, 0])
        square([7, 6], true);
    }

    cylinder(h = 10, r = 8, center = true,  $fn = 100);
}
