if (keyboard_check_pressed(vk_escape)) {
    global.pause = !global.pause;
    if (global.pause) {
        pause_estado = "menu";
        pause_index = 0;
    }
}

if (global.pause) {
    if (keyboard_check_pressed(ord("S"))) {
        if (pause_estado == "menu") pause_index = (pause_index + 1) mod pause_op_max;
        else if (pause_estado == "salvar") pause_salvar_index = (pause_salvar_index + 1) mod 4;
    }

    if (keyboard_check_pressed(ord("W"))) {
        if (pause_estado == "menu") pause_index = (pause_index - 1 + pause_op_max) mod pause_op_max;
        else if (pause_estado == "salvar") pause_salvar_index = (pause_salvar_index - 1 + 4) mod 4;
    }

    if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) {
        if (pause_estado == "menu") {
            switch (pause_index) {
                case 0:
                    pause_estado = "salvar";
                    pause_salvar_index = 0;
                    break;
                case 1:
                    // Aqui você pode abrir o menu de opções do pause
                    break;
                case 2:
                    game_end();
                    break;
            }
        }
        else if (pause_estado == "salvar") {
            if (pause_salvar_index < 3) {
                var slot = pause_salvar_index + 1;
                ini_open("save" + string(slot) + ".ini");

                ini_write_real("jogo", "fase", room); // Exemplo

                ini_close();
                show_message("Jogo salvo no Slot " + string(slot));
                global.pause = false;
            } else {
                pause_estado = "menu";
            }
        }
    }
}
