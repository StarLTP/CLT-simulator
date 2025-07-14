// Verifica se o índice do sprite atual ainda é válido (se a cutscene não terminou).
if (current_sprite_index < array_length(cutscene_sprites)) {
    var _spr = cutscene_sprites[current_sprite_index];

    // Dimensões originais do seu sprite (400x500 pixels).
    var _sprite_width = sprite_get_width(_spr);
    var _sprite_height = sprite_get_height(_spr);

    // Dimensões da tela GUI atual (1920x1080 pixels).
    var _screen_width = display_get_gui_width();
    var _screen_height = display_get_gui_height();

    // Calcula os fatores de escala necessários para a largura e altura da tela.
    var _scale_x = _screen_width / _sprite_width;
    var _scale_y = _screen_height / _sprite_height;

    // A estratégia para "tamanho adequado" e "no meio da tela" é geralmente uma de duas:
    // 1. Cobrir a tela inteira, potencialmente cortando partes do sprite (zoom-to-fill, como Angry Birds fazia em parte).
    // 2. Ajustar o sprite inteiro na tela, adicionando barras pretas (letterboxing/pillarboxing).
    // Vou usar a opção 2 para garantir que o sprite inteiro seja visível sem cortes.
    var _final_scale = min(_scale_x, _scale_y); // Use a menor escala para que o sprite caiba *inteiro* na tela.

    // Calcula as dimensões finais do sprite após a escala.
    var _drawn_width = _sprite_width * _final_scale;
    var _drawn_height = _sprite_height * _final_scale;

    // Calcula as coordenadas para desenhar o sprite centralizado na tela.
    // draw_sprite_ext desenha a partir do ponto de origem do sprite.
    // Se o sprite tem origem (0,0) (canto superior esquerdo), este cálculo centraliza.
    var _draw_x = (_screen_width - _drawn_width) / 2;
    var _draw_y = (_screen_height - _drawn_height) / 2;

    // Desenha o sprite com a escala e posição calculadas.
    // _spr: O asset do sprite.
    // 0: A sub-imagem (0 para sprites estáticos).
    // _draw_x, _draw_y: As coordenadas X e Y onde o sprite será desenhado.
    // _final_scale, _final_scale: Os fatores de escala para X e Y.
    // 0: Rotação (0 para nenhuma).
    // c_white: Cor de mistura (branco para cor normal do sprite).
    // 1: Alpha (1 para totalmente opaco).
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