var snd = audio_play_sound(snd_menu_select, 1, false);
audio_sound_gain(snd, global.config_volume / 100, 0);

switch (estado_menu) {
    case "menu":
        switch (index) {
            case 0: room_goto_next(); break;
            case 1: estado_menu = "carregar"; carregar_index = 0; break;
            case 2: estado_menu = "opcoes"; global.config_index = 0; break;
            case 3: game_end(); break;
        }
        break;

    case "opcoes":
        var voltou = scr_opcoes_selecao();
        if (voltou) {
            estado_menu = "menu";
        }
        break;

    case "carregar":
        if (carregar_index < 3) {
            if (file_exists("save" + string(carregar_index + 1) + ".ini")) {
                ini_open("save" + string(carregar_index + 1) + ".ini");
                var fase = ini_read_real("jogo", "fase", 1);
                ini_close();
                show_message("Carregado: Fase " + string(fase));
                room_goto_next(); // Substitua pela sala correta
            } else {
                show_message("Slot vazio.");
            }
        } else {
            estado_menu = "menu";
        }
        break;
}
