// Rich Whiffen
// 2025-08-22 - V1.0 simple parametric dembossed loop
//

//how wide a loop do you need?
diameter = 25;
//change the hight of the loop here
height = 5;
//Set how think you want the loop walls to be.
thickness = 4;

//you can make the loop smoother by increasing the segment count
segment_count = 80;

//construct the labe we put on the outside of the loop
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


