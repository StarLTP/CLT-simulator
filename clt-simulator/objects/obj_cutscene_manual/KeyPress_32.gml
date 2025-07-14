// Verifica se ainda há mais sprites na cutscene para avançar.
if (current_sprite_index < array_length(cutscene_sprites) - 1) {
    // Avança para o próximo sprite.
    current_sprite_index++;
} else {
    // Se não há mais sprites, a cutscene terminou.
    show_debug_message("Cutscene manual terminada! Mudando para a próxima room.");

    // Mudar para a próxima room.
    room_goto_next();

    // Destruir este objeto, pois ele não é mais necessário.
    instance_destroy();
}