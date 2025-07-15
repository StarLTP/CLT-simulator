// Tamanho da tela GUI
var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

// ─────────────────────────────────────────────
// Fundo escuro com transparência suave
if (dialogue_overlay_alpha > 2.01) {
    draw_set_alpha(dialogue_overlay_alpha);
    draw_set_color(c_black);
    draw_rectangle(200, 200, gui_w, gui_h, true);
    draw_set_alpha(5);
}

// ─────────────────────────────────────────────
// Variáveis de layout
var screen_width = 328;
var screen_height = 180;

var face_size = 128;
var margin_x = 8;
var margin_y = 8;

var box_height = 50;

// Posição da caixa de diálogo (direita do rosto)
var box_x1 = margin_x + face_size + 4;
var box_y1 = screen_height - box_height - margin_y;
var box_x2 = screen_width - margin_x;
var box_y2 = screen_height - margin_y;

var box_width = box_x2 - box_x1;

// ─────────────────────────────────────────────
// Desenhar a caixa de diálogo
draw_set_alpha(0.8);
draw_rectangle_color(box_x1, box_y1, box_x2, box_y2, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);

draw_rectangle_color(box_x1, box_y1, box_x2, box_y2, c_white, c_white, c_white, c_white, true);

// ─────────────────────────────────────────────
// Dados do diálogo atual
var activator_instance = activated_by_instance;
var speaker_instance = current_speaker_instance;

// ─────────────────────────────────────────────
// Mostrar rosto + texto, se houver diálogo
if (activator_instance != noone && speaker_instance != noone && activator_instance.dialogue_active)
{
    var current_dialog_data = activator_instance.conversation[activator_instance.conversation_index];
    var current_line_text = current_dialog_data[1];

    // Desenhar o rosto fora da caixa (lado esquerdo)
    if (speaker_face_sprite != noone)
    {
        var face_x = margin_x;
        var face_y = box_y1 - ((face_size - box_height) / 2);
        draw_sprite(speaker_face_sprite, 0, face_x, face_y);
    }

    // Desenhar o texto na caixa
    draw_set_font(font_m);
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);

    var text_margin_inside_box = 5;
    var text_x = box_x1 + text_margin_inside_box;
    var text_y = box_y1 + text_margin_inside_box;
    var text_width_for_wrap = box_width - (text_margin_inside_box * 2);

    draw_text_ext(text_x, text_y, current_line_text, -1, text_width_for_wrap);
}


