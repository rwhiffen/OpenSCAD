//Rich Whiffen
//2025-08-22 Making a plain cylinder loop with rounded edges
// adding the BOLS2 library to try and round the edges

// https://www.reddit.com/r/openscad/comments/1h12z83/comment/lz8hl35/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
// is where I got this idea from

include <BOSL2/std.scad>

diameter = 25;
height = 5;
thickness = 4;
segment_count = 80;

$fn = segment_count;


//create a bols2 library cylinders and make them hollow with difference.
// note that the bols2 cyl function uses l= for length instead of h= for height
// At some point I should add the label to the outside via the BOLS2 texture function

translate([diameter/2*-1, 0, 0])
difference() {
    cyl(l=height, d=diameter + thickness, rounding=1);
    cyl(l=height, d=diameter);
}