// Google Gemini generated code for the box, I just added the circle loop
// attched to the AI generated code for the box.
//
// rwhiffen - https://github.com/rwhiffen/OpenSCAD/tree/main/modi-loop-box
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
    box();
}

if (part == "lid" || part == "both") {
    // Moves the lid to the side for viewing, or sits it on top
    translate([part == "both" ? size + 10 : 0, 0, size - wall - groove_h + tolerance]) 
        lid();
}

module box() {
    difference() {
        // 1. Main Cube Body
        cube([size, size, size]);
        
        // 2. Internal Cavity (The hollow center)
        translate([wall, wall, wall])
            cube([inner_size, inner_size, size]);
        
        // 3. The Tracks (Left, Right, and Back)
        // Left Track
        translate([wall - groove_d, wall, size - wall - groove_h])
            cube([groove_d + 0.1, size - wall, groove_h]);
        
        // Right Track
        translate([size - wall, wall, size - wall - groove_h])
            cube([groove_d + 0.1, size - wall, groove_h]);
            
        // Back Track (Stops the lid from sliding out the back)
        translate([wall, size - wall, size - wall - groove_h])
            cube([inner_size, groove_d + 0.1, groove_h]);

        // 4. FRONT ENTRANCE CUTOUT (This allows the lid to slide in)
        // We cut out the top section of the front wall
        translate([wall - groove_d, -0.1, size - wall - groove_h])
            cube([inner_size + (groove_d * 2), wall + 0.2, groove_h]);
    }
}

module lid() {
    // The lid width must account for the grooves on both sides minus tolerance
    lid_w = inner_size + (groove_d * 2) - (tolerance * 2);
    // The lid length goes from the front face to the back groove
    lid_l = (size - wall) + groove_d - tolerance;
    lid_h = groove_h - (tolerance * 2);
    
    union() {
        // The main sliding plate
        // Centered horizontally within the tracks
        translate([wall - groove_d + tolerance, 0, 0])
            cube([lid_w, lid_l, lid_h]);
            
        // Optional: Small pull-tab or notch on the front
        translate([size/2, 2, lid_h])
            sphere(r = 2, $fn=32);
    }
}