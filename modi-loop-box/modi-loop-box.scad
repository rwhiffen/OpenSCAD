// Google Gemini generated code for the box, I just added the circle loop
// attched to the AI generated code for the box.
//
// rwhiffen - 
//
// --- Parameters ---
size = 30;              // External cube size (30mm)
wall = 2;               // Wall thickness (2mm)
tolerance = 0.2;        // Printing gap (0.2mm)
groove_h = 2;           // Height of the sliding track
groove_d = 1;           // How deep the track cuts into the wall

// --- Calculations ---
inner_size = size - (wall * 2);

// Render Selection (Change to "lid" or "box")
part = "both"; // [box, lid, both]

if (part == "box" || part == "both") {
    translate([0, 0, 0]) box();
}

if (part == "lid" || part == "both") {
    // Moves the lid to the side for viewing, or sits it on top
    translate([part == "both" ? size + 10 : 0, 0, 0]) lid();
}

module box() {
    difference() {
        // Main Cube
        cube([size, size, size]);
        
        // Internal Cavity
        translate([wall, wall, wall])
            cube([inner_size, inner_size, size]);
        
        // Sliding Grooves (Left, Right, and Back)
        // Left Groove
        translate([wall - groove_d, wall, size - wall - groove_h])
            cube([groove_d + 0.1, inner_size, groove_h]);
        
        // Right Groove
        translate([size - wall - 0.1, wall, size - wall - groove_h])
            cube([groove_d + 0.1, inner_size, groove_h]);
            
        // Back Groove
        translate([wall, size - wall - 0.1, size - wall - groove_h])
            cube([inner_size, groove_d + 0.1, groove_h]);
    }
}

module lid() {
    lid_w = inner_size + (groove_d * 2) - (tolerance * 2);
    lid_l = inner_size + groove_d - tolerance;
    lid_h = groove_h - tolerance;
    
    union() {
        // Main Lid Plate
        translate([wall + tolerance, wall + tolerance, 0])
            cube([inner_size - (tolerance * 2), lid_l, lid_h]);
        
        // Side Tongues (Left and Right)
        translate([wall - groove_d + tolerance, wall + tolerance, 0])
            cube([lid_w, lid_l, lid_h]);
            
        // Small thumb notch for easy opening
        translate([size/2, wall + 5, lid_h])
            sphere(r = 3, $fn=32);
    }
}