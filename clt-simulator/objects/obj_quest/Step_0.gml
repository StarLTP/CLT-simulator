// Lógica de pause
if (global.pause) {
    image_speed = 0;
    exit;
} else {
    image_speed = 1;
}

var player_instance = instance_nearest(x, y, obj_player);
var interaction_distance = 50;

// ======================
// MODO ESCOLHA ATIVO
// ======================
if (modo_escolha) {
    // Navegar entre opções
    if (keyboard_check_pressed(vk_up)) {
        resposta_selecionada--;
        if (resposta_selecionada < 0) resposta_selecionada = array_length(respostas) - 1;
    }
    if (keyboard_check_pressed(vk_down)) {
        resposta_selecionada++;
        if (resposta_selecionada >= array_length(respostas)) resposta_selecionada = 0;
    }

    // Confirmar escolha
    if (keyboard_check_pressed(vk_enter)) {
        if (resposta_selecionada == resposta_correta) {
            show_message("Resposta correta!");
        } else {
            show_message("Resposta errada...");
        }
        modo_escolha = false; 
    }
    exit; 
}

// ======================
// LÓGICA DE INTERAÇÃO
// ======================
if (player_instance != noone && point_distance(x, y, player_instance.x, player_instance.y) < interaction_distance) {
    if (keyboard_check_pressed(ord("E"))) {

        if (!dialogue_active) {
            // Inicia conversa
            dialogue_active = true;
            conversation_index = 0;
            audio_play_sound(snd_menu_select, 1, false);

            var new_textbox_instance = instance_create_layer(0, 0, "UI_Layer", obj_textbox_quest);
            new_textbox_instance.activated_by_instance = id;

            var current_line_data = conversation[conversation_index];
            var speaker_type = current_line_data[0];

            if (speaker_type == "NPC") {
                new_textbox_instance.current_speaker_instance = id;
                new_textbox_instance.speaker_face_sprite = my_face_sprite;
            } else if (speaker_type == "PLAYER") {
                new_textbox_instance.current_speaker_instance = player_instance;
                new_textbox_instance.speaker_face_sprite = player_instance.player_face_sprite;
            }

        } else {
            // Avançar conversa
            conversation_index++;

            var existing_textbox_id = noone;
            if (instance_exists(obj_textbox_quest)) {
                existing_textbox_id = obj_textbox_quest;
            }

            if (conversation_index >= array_length(conversation) || existing_textbox_id == noone) {
                dialogue_active = false;
                if (existing_textbox_id != noone) {
                    instance_destroy(existing_textbox_id);
                }
            } else {
                var current_line_data = conversation[conversation_index];
                var speaker_type = current_line_data[0];

                if (speaker_type == "NPC") {
                    existing_textbox_id.current_speaker_instance = id;
                    existing_textbox_id.speaker_face_sprite = my_face_sprite;
                } else if (speaker_type == "PLAYER") {
                    existing_textbox_id.current_speaker_instance = player_instance;
                    existing_textbox_id.speaker_face_sprite = player_instance.player_face_sprite;
                } else if (speaker_type == "RESPOSTA") {
                    modo_escolha = true;
                    respostas = current_line_data[3];
                    resposta_correta = current_line_data[1];
                    resposta_selecionada = 0;
					
                }
            }
        }
    }
} else {
    // Jogador longe do NPC
    if (dialogue_active) {
        dialogue_active = false;
        if (instance_exists(obj_textbox_quest)) {
            instance_destroy(obj_textbox_quest);
        }
    }
}
