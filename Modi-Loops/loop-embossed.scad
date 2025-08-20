// Rich Whiffen
// 2025-08-12 - try to emboss a loop

diameter = 25;
height = 5;
thickness = 4;
segment_count = 80;
size_label = str(diameter, "mm");

difference() {

    translate([diameter/2*-1, 0, 0])
    difference() {
        cylinder($fn = segment_count,
            $fa = 12,
            $fs = 2,
            h = 5, 
            d = diameter + thickness);
        cylinder($fn = segment_count,
            $fa = 12,
            $fs = 2,
            h = 5, 
            d = diameter);
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

translate([7, 0, 0])
difference() {
    cylinder($fn = segment_count,
           $fa = 12,
           $fs = 2,
           h = 5, 
           d = 9 + thickness);
    cylinder($fn = segment_count,
           $fa = 12,
           $fs = 2,
           h = 5, 
           d = 9);
}


