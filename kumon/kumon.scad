// 
// E190 Front: 7/139/1
// E190 Back: 8/154/1

// Edit these
NUM_QUESTIONS = 7;
HEIGHT = 139;  // from top of first question to top of last quesetion
QUESTION_HEIGHT = 10;
LEVEL = "E190 Front";

text_padding = 2;
text_height = 5;
text_recess = 0.8;
total_height = 190;
total_width = 110;
thickness = 0.6;
edge_distance = 5; // Distance from question holes to edge
question_spacing = HEIGHT / (NUM_QUESTIONS - 1);

padding = 4;
total_question_height = QUESTION_HEIGHT + padding * 2;
echo("total_question_height", total_question_height);
echo("question_spacing", question_spacing);

distance_from_top_to_bottom_questions = total_question_height + (NUM_QUESTIONS-1) * question_spacing;
leftover_space_on_top_and_bottom = total_height - distance_from_top_to_bottom_questions;
amount_to_shift_up_the_holes = leftover_space_on_top_and_bottom / 2;
echo("amount_to_shift_up_the_holes", amount_to_shift_up_the_holes);

module slab() {
    cube([total_width, total_height, thickness]);
}

module holes() {
    for (i =[0:NUM_QUESTIONS-1]) 
        translate([edge_distance, amount_to_shift_up_the_holes + i*question_spacing ,-10])
        cube([total_width - edge_distance*2, total_question_height, thickness + 20]);
}

module name() {
    translate([text_padding,total_height-text_height-text_padding,thickness-text_recess]) linear_extrude(1) text(LEVEL, text_height);
}


difference() {
    slab();
    holes();
    name();
}
