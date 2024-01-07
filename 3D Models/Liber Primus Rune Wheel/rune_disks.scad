include <lp_wheel_config.scad>
use<rune_plates.scad>

module outer_ring_bevel(){

    for(theta=[0.25:1:29]){
        translate([0,0,4])
        rotate(a=[theta*360/29,90,0])
        cylinder(h=main_disk_radius*0.99, r=0.8);
    };
}
module inner_ring_bevel(){

    for(theta=[0.25:1:29]){
        translate([0,0,8])
        rotate(a=[theta*360/29,90,0])
        cylinder(h=small_disk_radius*0.99, r=0.8);
    };
}
module inner_ring_lock(){

    for(theta=[0.23:1:29]){
        translate([0,0,4])
        rotate(a=[theta*360/29,90,0])
        cylinder(h=small_disk_radius*0.99, r=0.8);
    };
}

module main_disk(){
    
    difference(){
        
        // Main Disk
        color("DimGray")
        rotate([0,0,-3.125])
        cylinder(h=4, r=main_disk_radius, $fn=29);

        
        rune_plates();
    }

    color("black")
    outer_ring_bevel();

    // Disk Nub
    color("gray")
    cylinder(h=15, r=3, $fn=200);
    
    rune_plate_pegs();
}

module small_rune_plates(){
    
    translate([0,0,4])
    scale([small_disk_scale,small_disk_scale,1])
    rune_plates();
}


module FOL() {
    linear_extrude(5, convexity=10, center=true)
    import(file = "FOL-symbol.svg", center=true, convexity=10);  
}

module small_disk(){
    union(){
        
        difference(){
        
            union(){
                // Base Circle for the Runes to Rest On
                color("DimGray")
                translate([0,0,4])
                rotate([0,0,-3.125])
                cylinder(h=4, r=small_disk_radius, $fn=29);
                
                // Base circle for Flower of Life Pattern
                color("DimGray")
                translate([0,0,5.5])
                cylinder(h=3.5, r=small_disk_radius-(small_disk_scale*plate_height)-2.5, $fn=29);
                
                // Add Flower of Life Pattern to Inner Circle
                color("gold")    
                translate([0,0,8])
                scale(0.58)
                FOL();
                
                // Add Beveled Edges Marking between Runes
                color("black")
                inner_ring_bevel();
    
            }
            
            // Cut Out Disk Nub Hole
            cylinder(h=10, r=3.1, $fn=200);
            
            // Cut out Bevels for Ring Lock
            inner_ring_lock();
            
            // Cut Outs for the Rune Plates
            small_rune_plates();
            
        } // End of Disk Differences
          
        
    }

    
}

//Comment out whichever one you want to render:
//main_disk();

//small_disk();

