// Author: Samuel El-Borai
// Date: april 2014
//
// A `cruz andina' is a maya symbol


cruz_andina(10);

module cruz_andina(level) {
    pi = 3.141592653580;
    pi_decimal = (pi - 3) * 10;
    pi_dec_level = pi_decimal * level;

    thick_base = 1;
    thick_symbol = 2;


    linear_extrude(thick_base)
    union() {
        // Handle
        translate([0, 3 * level])
        difference() {
            circle(level / 3);
            circle(level / 5);
        }

        // Cross
        square([2 * level, 6 * level], center = true);
        square([6 * level, 2 * level], center = true);
        square([4 * level, 4 * level], center = true);
    }


    // Teluric circle
    linear_extrude(thick_symbol)
    difference() {
        circle(2.1 * level, $fn = 100);
        circle(2 * level, $fn = 100);
    }

    // Inner square
    linear_extrude(thick_symbol)
    difference() {
        square(2 * pi_dec_level, center = true);
        square(1.9 * pi_dec_level, center = true);
    };

    // Inner triangle
    linear_extrude(thick_symbol)
    difference() {
        polygon(points = [[-1 * pi_dec_level, -1 * pi_dec_level],
                          [0, pi_dec_level],
                          [pi_dec_level, -1 * pi_dec_level]],
                paths = [[0, 1, 2]]);

        polygon(points = [[-0.85 * pi_dec_level, -0.93 * pi_dec_level],
                          [0, 0.8 * pi_dec_level],
                          [0.85 * pi_dec_level, -0.93 * pi_dec_level]],
                paths = [[0, 1, 2]]);
    }


    // Middle circle
    linear_extrude(thick_symbol)
    translate([0, level / 3])
    circle(level / 5, $fn = 100);

    // Sun
    linear_extrude(thick_symbol)
    translate([2.5 * level, 0])
    union() {
        for(tetha = [0:60:360]) {
            rotate(tetha)
            translate([0, level / 3])
            square([level / 10, level / 5], center = true);
        }

        circle(level / 6, $fn = 100, center = true);
    }

    // Moon
    linear_extrude(thick_symbol)
    translate([-2.5 * level, 0])
    difference() {
        circle(level / 3);
        translate([level / 5, 0])
        circle(level / 5);
    }

    // Pyramid top
    linear_extrude(thick_symbol)
    translate([0, 2.5 * level])
    difference() {
        // Pyramid
        union() {
            translate([0, -2])
            square([10, 2], center = true);
            translate([0, 0])
            square([6, 2], center = true);
            translate([0, 2])
            square([2, 2], center = true);
        }

        // Triangle
        polygon(points = [[- level / 6, - level / 3],
                          [0, - level / 20],
                          [level / 6, - level / 3]],
                paths = [[0, 1, 2]]);
    }


    // Pyramid bottom
    linear_extrude(thick_symbol)
    translate([0, -2.5 * level])
    rotate(180)
    difference() {
        // Pyramid
        union() {
            translate([0, -2])
            square([10, 2], center = true);
            translate([0, 0])
            square([6, 2], center = true);
            translate([0, 2])
            square([2, 2], center = true);
        }

        // Triangle
        polygon(points = [[- level / 6, - level / 3],
                          [0, - level / 20],
                          [level / 6, - level / 3]],
                paths = [[0, 1, 2]]);
    }
}
