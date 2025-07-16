if (global.pause) {
    alarm[0] = room_speed * 1;
    exit;
}

var num_lixeiros_atuais = instance_number(obj_lixeiro);

if (num_lixeiros_atuais < global.lixeiros_ativos && num_lixeiros_atuais < max_lixeiros_simultaneos) {
    instance_create_layer(-1000, -1000, "Instances", obj_lixeiro);
    show_debug_message("Novo lixeiro criado. Total de lixeiros: " + string(num_lixeiros_atuais + 1));
} else {
    show_debug_message("Nao criou lixeiro: limite atingido ou jogo pausado. Lixeiros ativos: " + string(num_lixeiros_atuais));
}

var tempo_proximo = max(min_tempo_para_lixeiro, tempo_para_proximo_lixeiro - room_speed * 0.2);
tempo_para_proximo_lixeiro = tempo_proximo;

alarm[0] = tempo_para_proximo_lixeiro;