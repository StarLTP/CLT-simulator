if (estado_menu == "menu") {
    index = (index + 1) mod op_max;
} else if (estado_menu == "opcoes") {
    config_index = (config_index + 1) mod array_length(opcoes_config);
}
