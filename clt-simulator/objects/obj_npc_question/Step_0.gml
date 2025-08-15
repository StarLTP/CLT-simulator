if (distance_to_object(obj_player) < 32 && keyboard_check_pressed(ord("E"))) {
    if (!instance_exists(obj_dialogue_manager)) {
        var inst = instance_create_layer(0, 0, "UI", obj_dialogue_manager);
        inst.init(question, choices, correct_index, id);
    }
}
