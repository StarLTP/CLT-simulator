draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);

draw_text(10, 10, "Divida: " + string(global.divida));
draw_text(10, 40, "Tempo: " + string(ceil(global.tempo_minigame / room_speed)));

if (keyboard_check_pressed(vk_escape)) {
    global.pause = !global.pause;
}

if (!global.pause) {
    global.tempo_minigame--;

    // Lógica de ajuste de velocidade do jogador baseada na sala
    if (room_get_name(room) == "armazem") {
        if (obj_player.velocidade != 4) {
            obj_player.velocidade = 4;
            show_debug_message("Jogador no armazém, velocidade definida para " + string(obj_player.velocidade));
        }
    } else {
        if (obj_player.velocidade != 2) {
            obj_player.velocidade = 2;
            show_debug_message("Jogador fora do armazém, velocidade restaurada para " + string(obj_player.velocidade));
        }
    }

    // Condição de Vitória (Dívida Paga)
    if (global.divida <= global.meta_divida) {
        show_debug_message("Dívida Paga! Você Venceu!");
        // audio_play_sound(snd_FimMinigame, 1, false); // Descomente se tiver o som
        global.pause = true;
        show_message("Parabéns! Sua dívida foi paga!");
        // Aqui você pode adicionar room_goto(rm_tela_vitoria) ou game_restart()
    }

    // NOVA LÓGICA: Condição de Derrota (Tempo Esgotado)
    if (global.tempo_minigame <= 0) {
        show_debug_message("Tempo esgotado! Você Perdeu!");
        // audio_play_sound(snd_GameOver, 1, false); // Descomente se tiver um som de Game Over
        global.pause = true;
        show_message("O tempo acabou! Sua dívida continua alta! Game Over!");
        // Aqui você pode adicionar room_goto(rm_tela_derrota) ou game_restart()
    }
}