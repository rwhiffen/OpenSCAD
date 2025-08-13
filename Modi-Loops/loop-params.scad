// Rich Whiffen
// 2025-08-12 - starting to test parameters for loops

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
