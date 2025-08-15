// Desenha sprite de pensamento acima do jogador
draw_sprite(spr_thought, 0, obj_player.x, obj_player.y - 48);

// Pergunta
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(obj_player.x - 64, obj_player.y - 90, question);

// Respostas
for (var i = 0; i < array_length(choices); i++) {
    var xt = obj_player.x - 64;
    var yt = obj_player.y - 60 + i * 20;

    // Cor de fundo para seleção
    if (i == selected) {
        draw_set_alpha(0.2);
        draw_set_color(c_white);
        draw_rectangle(xt - 4, yt - 2, xt + string_width(choices[i]) + 4, yt + string_height(choices[i]) + 2, false);
        draw_set_alpha(1);
    }

    // Feedback visual após escolha
    if (phase == "feedback" && i == selected) {
        var correct = (selected == correct_idx - 1);
        var color = correct ? make_color_rgb(167, 240, 112) : make_color_rgb(177, 62, 83);
        draw_set_color(color);
    } else {
        draw_set_color(c_white);
    }

    draw_text(xt, yt, choices[i]);
}
