length_x = 380;
width_y = 80;
height_z = 20;
thickness = 3;
hole_diameter = 9;
hole_edge_offset_x = 18;
hole_edge_offset_y = 10;
hole_positions = [
    [hole_edge_offset_x, hole_edge_offset_y],
    [length_x - hole_edge_offset_x, hole_edge_offset_y],
    [length_x / 2, width_y - hole_edge_offset_y]
];
bottom_plate_support = 3;

difference() {
    union() {
        // Due montanti lungo Z.
        cube([length_x, thickness, height_z]);
        translate([0, width_y - thickness, 0])
            cube([length_x, thickness, height_z]);

        // Tratto lungo Y, in alto.
        translate([0, 0, height_z - thickness])
            cube([length_x, width_y, thickness]);

        // Battuta interna per appoggiare la placca_sotto.
        translate([thickness, thickness, 0])
            cube([length_x - 2 * thickness, bottom_plate_support, thickness]);
        translate([thickness, width_y - thickness - bottom_plate_support, 0])
            cube([length_x - 2 * thickness, bottom_plate_support, thickness]);
    }

    for (pos = hole_positions) {
        translate([pos[0], pos[1], height_z - thickness - 1])
            cylinder(h = thickness + 2, d = hole_diameter, $fn = 64);
    }
}
