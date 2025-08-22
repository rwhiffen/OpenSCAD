//Rich Whiffen
//2025-08-22 Making a plain cylinder loop with rounded edges
// - update - isnt working - I didn't understand the 2d vs 3d thing for hull
// might need to switch to 'extrude' instead of 'cylinder'.

//start with a plain hollow cylinder 

thickness = 3;
inner_d = 16;
outter_d = 20;

inner_r = inner_d /2;
outter_r = outter_d /2;
height = 5;

translate([0, 0, 0])
difference() {
    cylinder(h = height, d = outter_d);
    cylinder(h = height, d = inner_d);
}

//try the hull example from reddit
// https://www.reddit.com/r/openscad/comments/1h12z83/comment/lz8eg3z/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button

hull()
{
    // Bottom cap
    translate ([inner_r + thickness/2, thickness/2, 0])
        circle (d=thickness);

    //Top cap
    translate ([inner_r + thickness/2, height - thickness/2, 0])
        circle (d=thickness);
}