draw_set_font(font_m);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var screen_width = 328;
var screen_height = 180;

var margin_x = 8;
var margin_y = 8;

var box_height = 50;

var box_x1 = margin_x;
var box_y1 = screen_height - box_height - margin_y;
var box_x2 = screen_width - margin_x;
var box_y2 = screen_height - margin_y;

var box_width = box_x2 - box_x1;

draw_set_alpha(0.8);
draw_rectangle_color(box_x1, box_y1, box_x2, box_y2, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);

draw_rectangle_color(box_x1, box_y1, box_x2, box_y2, c_white, c_white, c_white, c_white, true);

var activator_instance = activated_by_instance;
var speaker_instance = current_speaker_instance;

if (activator_instance != noone && speaker_instance != noone && activator_instance.dialogue_active)
{
    var current_dialog_data = activator_instance.conversation[activator_instance.conversation_index];
    var current_line_text = current_dialog_data[1];

    var text_margin_inside_box = 5;
    var text_x = box_x1 + text_margin_inside_box;
    var text_y = box_y1 + text_margin_inside_box;
    var text_width_for_wrap = box_width - (text_margin_inside_box * 2);

    if (speaker_face_sprite != noone)
    {
        var face_size = 40; // Ajuste este valor para o tamanho do seu sprite de rosto
        var face_x = box_x1 + text_margin_inside_box;
        var face_y = box_y1 + text_margin_inside_box;

        draw_sprite(speaker_face_sprite, 0, face_x, face_y);

        text_x = face_x + face_size + text_margin_inside_box;
        text_width_for_wrap = box_width - (face_size + (text_margin_inside_box * 3));
    }

    draw_text_ext(text_x, text_y, current_line_text, -1, text_width_for_wrap);
}