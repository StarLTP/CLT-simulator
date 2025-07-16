
if (current_sprite_index < array_length(cutscene_sprites) - 1) {

    current_sprite_index++;
} else {

    show_debug_message("Cutscene manual terminada! Mudando para a próxima room.");


    room_goto_next();

    instance_destroy();
}