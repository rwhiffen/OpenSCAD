// Rich Whiffen
// 2025-08-12 - try to emboss a loop

diameter = 25;
height = 5;
thickness = 4;
segment_count = 80;

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
// Embossed text on the outside of the main loop
module embossed_text(txt, r, h, size, depth) {
    for (i = [0 : len(txt)-1]) {
        angle = i * 360 / len(txt);
        rotate([0,0,angle])
        translate([r, 0, h/2])
        linear_extrude(height = depth)
        text(txt[i], size = size, valign = "center", halign = "center");
    }
}

// Parameters for text
embossed_text("MODI", (diameter + thickness)/2, height, 4, 1);