if (keyboard_check_pressed(vk_escape)) {
    global.pause = !global.pause;
}

if (!global.pause) {
    global.tempo_minigame--;

    if (room_get_name(room) == "armazem") {
        if (obj_player.velocidade != 4) {
            obj_player.velocidade = 2;
            show_debug_message("Jogador no armazém, velocidade definida para " + string(obj_player.velocidade));
        }
    } else {
        if (obj_player.velocidade != 2) {
            obj_player.velocidade = 2;
            show_debug_message("Jogador fora do armazém, velocidade restaurada para " + string(obj_player.velocidade));
        }
    }

    if (global.divida <= global.meta_divida) {
        show_debug_message("Dívida Paga! Você Venceu!");
        // audio_play_sound(snd_FimMinigame, 1, false);
        global.pause = true;
        show_message("Parabéns! Sua dívida foi paga!");
    }
}