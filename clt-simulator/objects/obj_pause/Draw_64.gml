var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

if (global.pause) {
    // Fundo escuro transparente
    draw_set_alpha(0.8);
    draw_set_color(c_black);
    draw_rectangle(0, 0, gui_w, gui_h, false);
    draw_set_alpha(1);

    // Texto "Pausado"
    draw_set_color(c_white);
    draw_set_font(font_m);
    draw_set_halign(fa_center);
    draw_set_valign(fa_center);
    draw_text(gui_w / 2, gui_h / 2 - 100, "Pausado");

    // Desenhar as opções
    var dist = 60;
    var x1 = gui_w / 2;
    var y1 = gui_h / 2;

    for (var i = 0; i < op_max; i++) {
        draw_set_halign(fa_center);
        draw_set_valign(fa_center);

        if (index == i) {
            draw_set_color(c_orange);
        } else {
            draw_set_color(c_white);
        }

        draw_text(x1, y1 + (dist * i), opcoes[i]);
    }

    draw_set_halign(fa_left);  // Reset alinhamentos
    draw_set_valign(fa_top);
    draw_set_font(-1);
}
