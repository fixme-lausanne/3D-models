kobo_aura_hd();

module kobo_aura_hd() {
    polyhedron(
        points = [
            // When looking at the frontside
            [0, 0, 0], // 0, Top left corner
            [130, 0, 0], // 1, Top right corner
            [130, -178, 0], // 2, Bottom right corner
            [0, -178, 0], // 3, Bottom left corner

            // When looking at the backside
            [130, -176, -8], // 4, Bottom left corner
            [0, -176, -8], // 5, Bottom right corner
            [0, 0, -8], // 6, Top right corner
            [130, 0, -8], // 7, Top left corner

            [100, -2, -11], // 8, Top left hill
            [75, -2, -8], // 9, Top middle valley
            [35, -2, -11], // 10, Top right hill
            [95, -176, -11], // 11, Bottom left hill
            [65, -176, -8], // 12, Bottom middle valley
            [32, -176, -11] // 13, Bottom right hill
        ],
        faces = [
            [0, 1, 2, 3], // Front face
            [3, 5, 6, 0], // Left face
            [0, 6, 10, 9, 8, 7, 1], // Top face
            [1, 7, 4, 2], // Right face
            [2, 4, 11, 12, 13, 5, 3], // Bottom face

            // Back faces, starting to the right …
            [5, 13, 10, 6], // first column
            [13, 12, 9, 10], // second column, with kobo logo
            [12, 11, 8, 9], // third colmun
            [11, 4, 7, 8], // fourth column
        ]);
}
