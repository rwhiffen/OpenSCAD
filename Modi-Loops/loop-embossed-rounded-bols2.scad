// Rich Whiffen
// 2025-08-22 - Put it all together - try to emboss a loop with rounded edges using BOSL2
// 

diameter = 25;
height = 5;
thickness = 4;
segment_count = 80;
size_label = str(diameter, "mm");


$fn = segment_count;
include <BOSL2/std.scad>

difference() {

    translate([diameter/2*-1, 0, height/2])

    difference() {
        cyl(l=height, d=diameter + thickness, rounding=1);
        cyl(l=height, d=diameter);
}


    // Embossed diameter value on the outside of the main loop
    translate([diameter/2*-1, diameter/2 + thickness/2 - 1, height/2])
    rotate([90,0,180])
    linear_extrude(height = 3)
        text(size_label, size = height-2, valign = "center", halign = "center");
}

// add a second loop to the right of the main loop  
// This loop is smaller than the main loop used for attaching
// the loop to the tray.

translate([7,0, height/2])
difference() {
    cyl(l = height, d = 9 + thickness, rounding=1);
    cyl(l = height, d = 9);
}


