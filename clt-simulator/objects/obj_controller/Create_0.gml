// define valores padrão para evitar erro
config_volume = 100;
config_fullscreen = false;

// aplica volume padrão
audio_group_set_gain(audiogroup_default, config_volume/100, 0);

// configurações padrão
global.config_volume = 100;
global.config_fullscreen = false;

// aplica volume inicial
audio_group_set_gain(audiogroup_default, global.config_volume/100, 0);
