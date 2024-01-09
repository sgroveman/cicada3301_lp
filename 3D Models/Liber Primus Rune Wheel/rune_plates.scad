include <lp_wheel_config.scad>

module rune_data(){

    for(theta=[first_rune_index:1:final_rune_index]){

        
        
        color("black")   
        translate([0,0,6.0])
        linear_extrude(height = 1.65) {
            translate([(rune_index_offset)*sin(theta*360/29),(rune_index_offset)*cos(theta*360/29),0])
            rotate(a = -theta*360/29)
            text(str(theta), size=9, valign="center", halign="center", font="Junicode:style=Bold");
        };
        
        color("black")   
        translate([0,0,5.8])
        linear_extrude(height = 1.6) {
            translate([rune_offset*sin(theta*360/29),rune_offset*cos(theta*360/29),0])
            rotate(a = -theta*360/29)
            text(str(runes[theta]), size=13, valign="center", halign="center", font="Junicode:style=Bold");
        };
        
        color("black")   
        translate([0,0,5.2])
        linear_extrude(height = 1.6) {
            translate([rune_latin_offset*sin(theta*360/29),rune_latin_offset*cos(theta*360/29),0])
            rotate(a = -theta*360/29)
            if(theta == 21){
                text(str(latin_fragments[theta]), size=6, valign="center", halign="center", font="Junicode:style=Bold");
            }
            else{
                text(str(latin_fragments[theta]), size=7, valign="center", halign="center", font="Junicode:style=Bold");
            }
        };
        
        color("black")   
        translate([0,0,5.4])
        linear_extrude(height = 1.45) {
            translate([rune_prime_offset*sin(theta*360/29),rune_prime_offset*cos(theta*360/29),0])
            rotate(a = -theta*360/29)
            text(str(rune_prime_values[theta]), size=7, valign="center", halign="center", font="Junicode:style=Bold");
        };
        
    };
}

module rune_plate_pegs(){

    for(theta=[first_rune_index:1:final_rune_index]){
        
        translate([rune_peg_offsets*sin(theta*360/29),rune_peg_offsets*cos(theta*360/29),0])
        rotate(a = -theta*360/29)
        translate([0,0,1])
        scale([1,5,1])
        cylinder(h=rune_peg_height, r=rune_peg_radius, $fn=7);
    };
}

module rune_plates(){
    union(){
        
        difference(){
            
            for(theta=[first_rune_index:1:final_rune_index]){
                
                
                color("Silver")   
                
                translate([plate_offset*sin(theta*360/29),plate_offset*cos(theta*360/29),0])
                rotate(a = -theta*360/29)
                translate([0,0,4])
                rotate([90,90,0])
                scale([.2,1,1])
                cylinder(h=plate_height, r1=plate_top, r2=plate_bottom,$fn=10);
                
                
            };
            
            
            // Cutouts for the Pegs to hold the Rune Plates
            scale(1.025); // Tolerance for the rails
            rune_plate_pegs();
            
            
            // Cutouts in Plates for Rune Text Data
            rune_data();
        };
        
    }
    
}

module small_rune_plates(){
    
    translate([0,0,4])
    scale([small_disk_scale,small_disk_scale,1])
    rune_plates();
}


//Comment out whichever one you want to render:

rune_plates();

//small_rune_plates();

