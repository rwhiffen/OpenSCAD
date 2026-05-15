// Google Gemini generated code for the box, I did some minor tweaks, 
// and I added the circle loop to attched to the AI generated code for the box.
//
// I may take a fresh run at this in Gemini to ask the lid to have a trapezoidal shap like
// the concept box.
//
// rwhiffen - https://github.com/rwhiffen/OpenSCAD/tree/main/modi-loop-box
//
// --- Parameters ---
size = 30;              // External cube size (30mm)
wall = 2;               // Wall thickness (2mm)
tolerance = 0.2;        // Printing gap (0.2mm)
groove_h = 2;           // Height of the sliding track
groove_d = 1;           // How deep the track cuts into the wall
lid_offset_h = 1;       // offset from top of the lid - allows for lid to be positioned independantly
loop_percentage = 0.6;   // what percentage 0.00 -> 1.00 down the face should the loop be - allows for shifting the loop to allign with rails
segment_count = 80;    // smoothness of loop

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
        translate([wall - groove_d, wall, size - wall - lid_offset_h])
            cube([groove_d + 0.1, size - wall, groove_h]);
        
        // Right Track
        translate([size - wall, wall, size - wall - lid_offset_h])
            cube([groove_d + 0.1, size - wall, groove_h]);
            
        // Back Track (Stops the lid from sliding out the back)
        translate([wall, size - wall, size - wall - lid_offset_h])
            cube([inner_size, groove_d + 0.1, groove_h]);

        // 4. FRONT ENTRANCE CUTOUT (This allows the lid to slide in)
        // We cut out the top section of the front wall
        // plus the bridge
        translate([wall - groove_d, -0.1, size - wall - lid_offset_h])
            cube([inner_size + (groove_d * 2), wall + 0.2, groove_h]);
        translate([wall , -0.1, size - wall])
            cube([inner_size , wall + 0.2, groove_h]);
    
    }
    //add the tab for the loop
    translate([size*loop_percentage,-5,0])
        cube([5,5,groove_h]);
    //add the loop
    translate([size*loop_percentage+(5/2), -9 - (wall/2) , 0])
        difference() {
            cylinder($fn = segment_count,
                $fa = 12,
                $fs = 2,
                h = 5, 
                d = 9 + wall);
            cylinder($fn = segment_count,
                $fa = 12,
                $fs = 2,
                h = 5, 
                d = 9);
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
