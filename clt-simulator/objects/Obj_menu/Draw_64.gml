draw_set_font(font_m);
draw_set_halign(fa_center);
draw_set_valign(fa_center);

var dist = 60;
var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();
var x1 = gui_w / 2;
var y1 = gui_h / 2;

if (estado_menu == "menu") {
    for (var i = 0; i < op_max; i++) {
        draw_set_color(index == i ? c_orange : c_white);
        draw_set_alpha(index == i ? alpha_anim : 1);
        draw_text(x1, y1 + (dist * i), opcoes[i]);
    }
}
else if (estado_menu == "opcoes") {
    for (var i = 0; i < array_length(opcoes_config); i++) {
        draw_set_color(config_index == i ? c_orange : c_white);
        draw_set_alpha(config_index == i ? alpha_anim : 1);
        draw_text(x1, y1 + (dist * i), opcoes_config[i]);
    }
}
else if (estado_menu == "carregar") {
    for (var i = 0; i < 3; i++) {
        draw_set_color(carregar_index == i ? c_orange : c_white);
        draw_set_alpha(carregar_index == i ? alpha_anim : 1);
        draw_text(x1, y1 + (dist * i), save_slots[i]);
    }
    draw_set_color(carregar_index == 3 ? c_orange : c_white);
    draw_set_alpha(carregar_index == 3 ? alpha_anim : 1);
    draw_text(x1, y1 + (dist * 3), "Voltar");
}

draw_set_alpha(1);
draw_set_font(-1);
