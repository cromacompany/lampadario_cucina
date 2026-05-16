length_x = 380;
width_y = 80;
height_z = 20;
thickness = 3;
hole_diameter = 6;
hole_spacing = 284;
hole_y = width_y / 2;
hole_x1 = (length_x - hole_spacing) / 2;
hole_x2 = hole_x1 + hole_spacing;
center_hole_diameter = 40;
center_hole_x = length_x / 2;

difference() {
    union() {
        // Due montanti lungo Z.
        cube([length_x, thickness, height_z]);
        translate([0, width_y - thickness, 0])
            cube([length_x, thickness, height_z]);

        // Tratto lungo Y, in alto.
        translate([0, 0, height_z - thickness])
            cube([length_x, width_y, thickness]);

        // Chiusure alle due estremita lungo X.
        cube([thickness, width_y, height_z]);
        translate([length_x - thickness, 0, 0])
            cube([thickness, width_y, height_z]);
    }

    for (x = [hole_x1, hole_x2]) {
        translate([x, hole_y, height_z - thickness - 1])
            cylinder(h = thickness + 2, d = hole_diameter, $fn = 64);
    }

    translate([center_hole_x, hole_y, height_z - thickness - 1])
        cylinder(h = thickness + 2, d = center_hole_diameter, $fn = 96);
}
