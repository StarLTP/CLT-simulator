var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

if (global.pause) {
    var gui_w = display_get_gui_width();
    var gui_h = display_get_gui_height();

    // Fundo escuro
    draw_set_alpha(0.8);
    draw_set_color(c_black);
    draw_rectangle(0, 0, gui_w, gui_h, false);
    draw_set_alpha(1);

    draw_set_color(c_white);
    draw_set_font(font_m);
    draw_set_halign(fa_center);
    draw_set_valign(fa_center);

    draw_text(gui_w / 2, gui_h / 2 - 100, "Precione a tecla esc para retornar ao jogo");

    var dist = 60;
    var x1 = gui_w / 2;
    var y1 = gui_h / 2;

    if (pause_estado == "menu") {
        for (var i = 0; i < pause_op_max; i++) {
            draw_set_color(pause_index == i ? c_orange : c_white);
            draw_text(x1, y1 + (dist * i), pause_opcoes[i]);
        }
    }
    else if (pause_estado == "salvar") {
        draw_text(x1, y1 - 60, "Salvar Jogo");

        for (var i = 0; i < 4; i++) {
            draw_set_color(pause_salvar_index == i ? c_orange : c_white);
            draw_text(x1, y1 + (dist * i), pause_salvar_slots[i]);
        }
    }

    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_font(-1);
}
/////////////////////////////////////
 