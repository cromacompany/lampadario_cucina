width_y = 80;
height_z = 20;
thickness = 3;
plate_count = 2;
plate_spacing = 10;

module placca_laterale() {
    cube([thickness, width_y, height_z]);
}

for (i = [0 : plate_count - 1]) {
    translate([i * (thickness + plate_spacing), 0, 0])
        placca_laterale();
}
