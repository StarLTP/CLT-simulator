
// === CONTROLE DE ESCOLHA ===
if (modo_escolha) = true {

    // Navegar para cima
    if (keyboard_check_pressed(vk_up)) {
        resposta_selecionada--;
        if (resposta_selecionada < 0) resposta_selecionada = array_length(respostas) - 1;
    }

    // Navegar para baixo
    if (keyboard_check_pressed(vk_down)) {
        resposta_selecionada++;
        if (resposta_selecionada >= array_length(respostas)) resposta_selecionada = 0;
    }

    // Confirmar escolha
    if (keyboard_check_pressed(vk_enter)) {
        if (resposta_selecionada == resposta_correta) {
            show_message("Resposta correta!");
            //colocar código para continuar o diálogo
        } else {
            show_message("Resposta errada...");
            //colocar consequências
        }
        modo_escolha = false; 
    }

    exit; 
}

// Controle de overlay para escurecer a tela atrás do diálogo
if (activated_by_instance != noone && activated_by_instance.dialogue_active) {
    target_alpha = 0.8;
} else {
    target_alpha = 0;
}

var lerp_speed = 0.1;
dialogue_overlay_alpha = lerp(dialogue_overlay_alpha, target_alpha, lerp_speed);
