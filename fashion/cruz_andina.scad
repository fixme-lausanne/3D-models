cruz_andina(10);



module cruz_andina(level) {
    pi = 3.141592653580;
    pi_decimal = (pi - 3) * 10;
    pi_dec_level = pi_decimal * level;

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
        square(2 * pi_dec_level, center = true);
        square(1.9 * pi_dec_level, center = true);
    };

    // Inner triangle
    linear_extrude(2)
    difference() {
        polygon(points = [[-1 * pi_dec_level, -1 * pi_dec_level],
                          [0, pi_decimal * level],
                          [pi_dec_level, -1 * pi_dec_level]],
                paths = [[0, 1, 2]]);

        polygon(points = [[-0.8 * pi_dec_level, -0.8 * pi_dec_level],
                          [0, 0.8 * pi_dec_level],
                          [0.8 * pi_dec_level, -0.8 * pi_dec_level]],
                paths = [[0, 1, 2]]);
    }
}
