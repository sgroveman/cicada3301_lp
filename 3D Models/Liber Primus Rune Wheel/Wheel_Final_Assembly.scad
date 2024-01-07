include <lp_wheel_config.scad>
use <rune_plates.scad>
use <rune_disks.scad>
use <base_plate.scad>

module final_base_plate(){
    difference(){
        base_plate();
        main_disk();
    }
}

final_base_plate();

main_disk();
rune_plates();

small_disk();
small_rune_plates();

