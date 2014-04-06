cruz_andina(10);



module cruz_andina(level) {
    // Cross
    linear_extrude(1)
    union() {
        union() {
            square([2 * level, 6 * level], center = true);
            square([6 * level, 2 * level], center = true);
            square([4 * level, 4 * level], center = true);
        }
    }

    // Teluric circle
    linear_extrude(2)
    difference() {
        circle(2.1 * level, $fn = 100);
        circle(2 * level, $fn = 100);
    }

    // Inner square
    linear_extrude(2)
    difference() {
        square(2 * 1.41592653589 * level, center = true);
        square(1.9 * 1.41592653589 * level, center = true);
    };

    // Inner triangle
    linear_extrude(2)
    difference() {
        polygon(points = [[-1 * 1.41592653589 * level, -1 * 1.41592653589 * level],
                          [0, 1 * 1.414592653589 * level],
                          [1 * 1.414592653589 * level, -1 * 1.414592653589 * level]],
                paths = [[0, 1, 2]]);

        polygon(points = [[-0.8 * 1.41592653589 * level, -0.8 * 1.41592653589 * level],
                          [0, 0.8 * 1.414592653589 * level],
                          [0.8 * 1.414592653589 * level, -0.8 * 1.414592653589 * level]],
                paths = [[0, 1, 2]]);
    }
}
