if (activated_by_instance != noone && activated_by_instance.dialogue_active) {
    target_alpha = 0.8;
} else {
    target_alpha = 0;
}

var lerp_speed = 0.1;
dialogue_overlay_alpha = lerp(dialogue_overlay_alpha, target_alpha, lerp_speed);