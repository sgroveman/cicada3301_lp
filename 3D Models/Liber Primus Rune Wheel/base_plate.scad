include <lp_wheel_config.scad>
use <rune_disks.scad>

module base_plate(){
    
    color("DarkSlateGray")
    minkowski()
    {
        rotate([0,0,90])
        translate([0,0,-4])
        cylinder(h=4.5, r=165, $fn=6);
        sphere(2);
    };


    color("gold")
    for(theta=[0:1:28]){
        translate([135*sin(theta*360/29),135*cos(theta*360/29),0])
        rotate(a=[0,0,-theta*360/29+30-30*theta])
        cylinder(h=4, r1=4, r2=2,$fn=rune_prime_values[theta]+1);
        
    }

    color("gold")
    for(theta=[0:1:6]){
        translate([150*sin(theta*360/6),150*cos(theta*360/6),3])
        rotate(a=[180,0,-theta*360/6])
        scale(0.5)
        cicada();
    }
}

module cicada(){
    linear_extrude(5, convexity=10, center=true)
    import(file = "Cicada_3301_logo.svg", center=true, convexity=10); 
}



module final_base_plate(){
    difference(){
        base_plate();
        translate([0,0,0.8])
        main_disk();
    }
}

final_base_plate();
