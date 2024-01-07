
// Rune Data:
all_shifts = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22,23, 24, 25, 26, 27, 28];
runes = ["ᚠ", "ᚢ", "ᚦ", "ᚩ", "ᚱ", "ᚳ", "ᚷ", "ᚹ", "ᚻ", "ᚾ", "ᛁ", "ᛂ", "ᛇ", "ᛈ", "ᛉ", "ᛋ", "ᛏ","ᛒ", "ᛖ", "ᛗ", "ᛚ", "ᛝ", "ᛟ", "ᛞ", "ᚪ", "ᚫ", "ᚣ", "ᛡ", "ᛠ"];
rune_prime_values = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109];
latin_fragments = ["F", "U", "TH", "O", "R", "C", "G", "W", "H", "N", "I", "J", "EO", "P", "X","S", "T", "B", "E", "M", "L", "ING", "OE", "D", "A", "AE", "Y", "IA","EA"];

first_rune_index = 0;
final_rune_index = 28;

main_disk_radius = 130;

edge_tolerance = 2;
plate_offset = main_disk_radius-edge_tolerance;
plate_height = 40;
plate_top = 13.5;
plate_bottom = 9;

rune_peg_offsets = main_disk_radius-plate_height/2;
rune_peg_height = 3;
rune_peg_radius = 2;

rune_index_offset = main_disk_radius-8;
rune_offset = main_disk_radius-20;
rune_latin_offset = main_disk_radius-31;
rune_prime_offset = main_disk_radius-38;

small_disk_scale = 0.675;
small_disk_radius = main_disk_radius*small_disk_scale;
