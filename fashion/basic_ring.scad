// Author: Samuel El-Borai <samuel.elborai@gmail.com>
// Date: 04/04/2014
//
// A very basic ring

ring();

module ring() {
    difference() {
        partial_rotate_extrude(280, 20, 10)
        circle(6);
        cylinder(100, 20, 20, true);
    };
}

module pie_slice(radius, angle, step) {
	for(theta = [0:step:angle-step]) {
		rotate([0,0,0])
		linear_extrude(height = radius*2, center=true)
		polygon(
			points = [
				[0,0],
				[radius * cos(theta+step) ,radius * sin(theta+step)],
				[radius*cos(theta),radius*sin(theta)]
			]
		);
	}
}

module partial_rotate_extrude(angle, radius, convex) {
	intersection () {
		rotate_extrude(convexity=convex) translate([radius,0,0]) child(0);
		pie_slice(radius*2, angle, angle/30);
	}
}
