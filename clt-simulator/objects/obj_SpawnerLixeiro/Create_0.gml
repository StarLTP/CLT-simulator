if (instance_number(obj_SpawnerLixeiro) > 1) {
    instance_destroy();
    exit;
}

persistent = true;

tempo_para_proximo_lixeiro = room_speed * 5;
min_tempo_para_lixeiro = room_speed * 2;
max_lixeiros_simultaneos = 5;

alarm[0] = tempo_para_proximo_lixeiro;