// Controle geral de diálogo
dialogue_active = false;    // controla se o diálogo está ativo
conversation_index = 0;     // índice da linha atual da conversa

// Variáveis de escolha
modo_escolha = false;       // se está no modo de escolha de respostas
respostas = [];             // array com as opções de resposta
resposta_correta = 0;       // índice da resposta correta
resposta_selecionada = 0;   // índice da resposta selecionada pelo jogador

// Face do NPC (sprite de retrato)
my_face_sprite = spr_face_default; // ajuste para o sprite correto
