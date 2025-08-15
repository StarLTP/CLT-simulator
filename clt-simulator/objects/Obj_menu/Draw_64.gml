/// DRAW GUI do obj_menu

draw_set_font(Font_menu);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var dist = 70;
var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();
var x1 = gui_w / 10;
var y1 = gui_h / 5;

switch (estado_menu) {
    case "menu":
        for (var i = 0; i < op_max; i++) {
            draw_set_color(index == i ? make_color_rgb(167, 240, 112) : c_white);

            draw_set_alpha(index == i ? alpha_anim : 1);
            draw_text(x1, y1 + (dist * i), opcoes[i]);
        }
        break;

    case "opcoes":
        scr_opcoes_draw(x1, y1, dist);
        break;

    case "carregar":
        for (var i = 0; i < 3; i++) {
            draw_set_color(carregar_index == i ? make_color_rgb(167, 240, 112) : c_white);
            draw_set_alpha(carregar_index == i ? alpha_anim : 1);
            draw_text(x1, y1 + (dist * i), save_slots[i]);
        }
        draw_set_color(carregar_index == 3 ? make_color_rgb(167, 240, 112) : c_white);
        draw_set_alpha(carregar_index == 3 ? alpha_anim : 1);
        draw_text(x1, y1 + (dist * 3), "Voltar");
        break;
}

draw_set_alpha(1);
draw_set_font(-1);
