if (estado_menu == "menu") {
    index = (index - 1 + op_max) mod op_max;
} else if (estado_menu == "opcoes") {
    config_index = (config_index - 1 + array_length(opcoes_config)) mod array_length(opcoes_config);
}
