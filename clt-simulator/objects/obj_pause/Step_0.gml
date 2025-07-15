
// --------------------- Alternar pause com ESC --------------------- 
if (keyboard_check_pressed(vk_escape)) {
    global.pause = !global.pause;

    if (global.pause) {
        pause_estado = "menu";
        pause_index = 0;
        pause_salvar_index = 0;
        global.config_index = 0;
        pause_salvar_slots = scr_gerar_lista_slots();
    }
}

// Só executa a lógica de menu se estiver pausado
if (global.pause) {
    
// --------------------- Navegação no menu principal do pause --------------------- 
    if (pause_estado == "menu") {
        if (keyboard_check_pressed(ord("S"))) {
            pause_index = (pause_index + 1) mod pause_op_max;
        }

        if (keyboard_check_pressed(ord("W"))) {
            pause_index = (pause_index - 1 + pause_op_max) mod pause_op_max;
        }

        if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) {
            switch (pause_index) {
                case 0:
                    pause_estado = "salvar";
                    pause_salvar_index = 0;
                    pause_salvar_slots = scr_gerar_lista_slots();
                    break;

                case 1:
                    pause_estado = "opcoes";
                    global.config_index = 0;
                    break;

                case 2:
                    game_end();
                    break;
            }
        }
    }


// --------------------- Submenu: Salvar Jogo --------------------- 

    else if (pause_estado == "salvar") {
        if (keyboard_check_pressed(ord("S"))) {
            pause_salvar_index = (pause_salvar_index + 1) mod 4;
        }

        if (keyboard_check_pressed(ord("W"))) {
            pause_salvar_index = (pause_salvar_index - 1 + 4) mod 4;
        }

        if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) {
            if (pause_salvar_index < 3) {
                scr_salvar_slot(pause_salvar_index);
                pause_salvar_slots = scr_gerar_lista_slots(); // Atualiza após salvar
                global.pause = false;
            } else {
                pause_estado = "menu";
            }
        }
    }


// --------------------- Submenu: Opções --------------------- 

    else if (pause_estado == "opcoes") {
        scr_opcoes_navegacao();

        if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) {
            if (scr_opcoes_selecao()) {
                pause_estado = "menu"; // voltou
            }
        }
    }
}
