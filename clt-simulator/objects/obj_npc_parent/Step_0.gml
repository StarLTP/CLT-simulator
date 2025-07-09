//pause
if(global.pause){
	image_speed = 0;
	exit;
}else{
	image_speed = 1;
}


var player_instance = instance_nearest(x, y, obj_player);
var interaction_distance = 64;

if (player_instance != noone && point_distance(x, y, player_instance.x, player_instance.y) < interaction_distance)
{
    if (keyboard_check_pressed(ord("E")))
    {
        if (!dialogue_active) // Inicia a conversa
        {
            dialogue_active = true;
            conversation_index = 0;

            var new_textbox_instance = instance_create_layer(0, 0, "UI_Layer", obj_textbox);
            new_textbox_instance.activated_by_instance = id; // O NPC que ativou a caixa

            var current_line_data = conversation[conversation_index];
            var speaker_type = current_line_data[0];

            if (speaker_type == "NPC") {
                new_textbox_instance.current_speaker_instance = id;
                new_textbox_instance.speaker_face_sprite = my_face_sprite;
            } else if (speaker_type == "PLAYER") {
                new_textbox_instance.current_speaker_instance = player_instance;
                new_textbox_instance.speaker_face_sprite = player_instance.player_face_sprite;
            }
        }
        else // Avança a conversa
        {
            conversation_index++;

            if (conversation_index >= array_length(conversation))
            {
                dialogue_active = false;
                instance_destroy(obj_textbox);
            }
            else
            {
                var existing_textbox_instance = obj_textbox; 

                var current_line_data = conversation[conversation_index];
                var speaker_type = current_line_data[0];

                if (speaker_type == "NPC") {
                    existing_textbox_instance.current_speaker_instance = id;
                    existing_textbox_instance.speaker_face_sprite = my_face_sprite;
                } else if (speaker_type == "PLAYER") {
                    existing_textbox_instance.current_speaker_instance = player_instance;
                    existing_textbox_instance.speaker_face_sprite = player_instance.player_face_sprite;
                }
            }
        }
    }
}
else
{
    if (dialogue_active)
    {
        dialogue_active = false;
        instance_destroy(obj_textbox);
    }
}