length_x = 380;
width_y = 80;
thickness = 3;
clearance = 0.4;

plate_length_x = length_x - 2 * thickness - clearance;
plate_width_y = width_y - 2 * thickness - clearance;
plate_thickness = 3;

hole_diameter = 6;
hole_spacing = 284;
hole_y = plate_width_y / 2;
hole_x1 = (plate_length_x - hole_spacing) / 2;
hole_x2 = hole_x1 + hole_spacing;
center_hole_diameter = 40;
center_hole_x = plate_length_x / 2;

difference() {
    cube([plate_length_x, plate_width_y, plate_thickness]);

    for (x = [hole_x1, hole_x2]) {
        translate([x, hole_y, -1])
            cylinder(h = plate_thickness + 2, d = hole_diameter, $fn = 64);
    }

    translate([center_hole_x, hole_y, -1])
        cylinder(h = plate_thickness + 2, d = center_hole_diameter, $fn = 96);
}
