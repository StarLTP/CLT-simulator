// Declaração das variáveis locais usadas para layout
var margin_x = 8;
var margin_y = 8;
var screen_width = 328;
var screen_height = 180;
var face_size = 128;
var box_height = 50;

// Se estiver em modo escolha, desenha as opções
if (modo_escolha) {
    // Posições da caixa
	draw_set_font(font_m);
    var box_x1 = margin_x + face_size + 4;
    var box_y1 = screen_height - box_height - margin_y;
    var box_x2 = screen_width - margin_x;
    var box_y2 = screen_height - margin_y;

    var box_width = box_x2 - box_x1;

    // Fundo semi-transparente da caixa
    draw_set_alpha(0.8);
    draw_rectangle_color(box_x1, box_y1, box_x2, box_y2, c_black, c_black, c_black, c_black, false);
    draw_set_alpha(1);

    // Borda da caixa
    draw_rectangle_color(box_x1, box_y1, box_x2, box_y2, c_white, c_white, c_white, c_white, true);

    // Configurações de fonte e alinhamento
    draw_set_font(font_m);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);

    var start_x = box_x1 + 10;
    var start_y = box_y1 + 10;
    var line_height = 24;

    // Desenha as opções de resposta
    for (var i = 0; i < array_length(respostas); i++) {
        if (i == resposta_selecionada) {
			draw_set_font(font_m);
            draw_set_color(c_yellow);
            draw_text(start_x - 15, start_y + i * line_height, "→"); 
        } else {
            draw_set_color(c_white);
        }
        draw_text(start_x, start_y + i * line_height, respostas[i]);
    }

    draw_set_color(c_white);

    return; 
}


var activator_instance = activated_by_instance;
var speaker_instance = current_speaker_instance;

if (activator_instance != noone && speaker_instance != noone && activator_instance.dialogue_active)
{
    var current_dialog_data = activator_instance.conversation[activator_instance.conversation_index];
    var current_line_text = current_dialog_data[1];

    // Posição do rosto do NPC
    var face_x = margin_x;
    var face_y = screen_height - face_size - margin_y;

    if (speaker_face_sprite != noone)
    {
        draw_sprite(speaker_face_sprite, 0, face_x, face_y);
    }

    // Desenha a caixa de diálogo
    var box_x1 = margin_x + face_size + 4;
    var box_y1 = screen_height - box_height - margin_y;
    var box_x2 = screen_width - margin_x;
    var box_y2 = screen_height - margin_y;
    var box_width = box_x2 - box_x1;

    draw_set_alpha(0.8);
    draw_rectangle_color(box_x1, box_y1, box_x2, box_y2, c_black, c_black, c_black, c_black, false);
    draw_set_alpha(1);

    draw_rectangle_color(box_x1, box_y1, box_x2, box_y2, c_white, c_white, c_white, c_white, true);

    // Configurações de fonte e alinhamento para texto
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
