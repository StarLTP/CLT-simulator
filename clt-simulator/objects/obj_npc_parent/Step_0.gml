// Evento Step para obj_npc_parent

// Lógica de pause
if (global.pause) {
	image_speed = 0;
	exit;
} else {
	image_speed = 1;
}

var player_instance = instance_nearest(x, y, obj_player);
var interaction_distance = 50;

if (player_instance != noone && point_distance(x, y, player_instance.x, player_instance.y) < interaction_distance) {
    if (keyboard_check_pressed(ord("E"))) {
        if (!dialogue_active) { // Iniciar conversa
            dialogue_active = true;
            conversation_index = 0;
			// Reproduz som de seleção
			audio_play_sound(snd_menu_select, 1, false);


            var new_textbox_instance = instance_create_layer(0, 0, "UI_Layer", obj_textbox);
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
        } else { // Avançar conversa
            conversation_index++;

            var existing_textbox_id = noone;
            if (instance_exists(obj_textbox)) {
                existing_textbox_id = obj_textbox;
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
                }
            }
        }
    }
} else { // Jogador está longe do NPC
    if (dialogue_active) {
        dialogue_active = false;
        if (instance_exists(obj_textbox)) {
            instance_destroy(obj_textbox);
        }
    }
}