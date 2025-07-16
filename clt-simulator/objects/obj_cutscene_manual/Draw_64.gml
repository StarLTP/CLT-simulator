
if (current_sprite_index < array_length(cutscene_sprites)) {
    var _spr = cutscene_sprites[current_sprite_index];


    var _sprite_width = sprite_get_width(_spr);
    var _sprite_height = sprite_get_height(_spr);


    var _screen_width = display_get_gui_width();
    var _screen_height = display_get_gui_height();

    var _scale_x = _screen_width / _sprite_width;
    var _scale_y = _screen_height / _sprite_height;

  
  
    var _final_scale = min(_scale_x, _scale_y); 

    var _drawn_width = _sprite_width * _final_scale;
    var _drawn_height = _sprite_height * _final_scale;


    var _draw_x = (_screen_width - _drawn_width) / 2;
    var _draw_y = (_screen_height - _drawn_height) / 2;


    draw_sprite_ext(
        _spr,
        0,
        _draw_x,
        _draw_y,
        _final_scale,
        _final_scale,
        0,
        c_white,
        1
    );
}