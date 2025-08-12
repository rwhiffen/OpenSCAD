//Making a plain cylinder loop.
cylinder(h = 5, d = 20);

//making it thicker.
difference() {
    cylinder(h = 5, d = 20);
    cylinder(h = 5, d = 16);
}

//two cylinders but not touching. 
//AI didn't get it right.

translate([-7, 0, 5])
cylinder(h = 5, d = 9);

translate([7, 0, 5])
cylinder(h = 5, d = 9);

//two hollow cylinders but not touching.

translate([-7, 0, 5])
difference() {
    cylinder(h = 5, d = 9);
    cylinder(h = 5, d = 5);
}

translate([7, 0, 5])
difference() {
    cylinder(h = 5, d = 9);
    cylinder(h = 5, d = 5);
}

//two hollow cylinders touching 80 segments (will need to be 360 eventually)

translate([-7, 0, 5])
difference() {
    cylinder($fn = 80,
           $fa = 12,
           $fs = 2,
           h = 5, 
           d = 20);
    cylinder($fn = 80,
           $fa = 12,
           $fs = 2,
           h = 5, 
           d = 15);
}

translate([6, 0, 5])
difference() {
    cylinder($fn = 80,
           $fa = 12,
           $fs = 2,
           h = 5, 
           d = 9);
    cylinder($fn = 80,
           $fa = 12,
           $fs = 2,
           h = 5, 
           d = 5);
}
