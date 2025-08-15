// Inicialização dos dados via função personalizada
function init(_question, _choices, _correct_idx, _npc_id) {
    question = _question;
    choices = _choices;
    correct_idx = _correct_idx; // índice 1~3
    npc_id = _npc_id;

    selected = 0;           // qual resposta está selecionada
    phase = "show_question";
    feedback_timer = 0;
}
