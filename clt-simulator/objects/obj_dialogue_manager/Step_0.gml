switch (phase) {
    case "show_question":
        // Mover seleção com seta para cima/baixo
        if (keyboard_check_pressed(ord("w"))) selected = max(selected - 1, 0);
        if (keyboard_check_pressed(ord("s"))) selected = min(selected + 1, array_length(choices) - 1);

        // Confirmar escolha
        if (keyboard_check_pressed(ord("e"))) {
            phase = "feedback";
            feedback_timer = room_speed; // 1 segundo de feedback
        }
        break;

    case "feedback":
        feedback_timer--;
        if (feedback_timer <= 0) {
            if (selected == correct_idx - 1) {
                //Resposta correta

                global.collected += 1;

                instance_create_layer(obj_player.x, obj_player.y, "Instances", obj_angulo180);

                scr_npc_talk(npc_id, "Obrigado Profi :3");
            } else {
                //Resposta incorreta
                scr_npc_talk(npc_id, "Não foi dessa vez, tente de novo...");
            }

            // Finaliza diálogo
            instance_destroy();
        }
        break;
}
