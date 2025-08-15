// Controle geral de diálogo
modo_escolha = false;
dialogue_active = false;   
conversation_index = 0;
respostas = [["Eu gosto de você!", "Você é estranho(a)...", "Quer ser meu amigo?"]];
resposta_correta = 0;
resposta_selecionada = 0;

// sprite retrato
my_face_sprite = spr_npc_aluno0; 
dialogo_etapa = 0;

    if (dialogo_etapa == 2) {
		
    with (obj_textbox_quest) {
        modo_escolha = true;
        resposta_correta = 0; 
        resposta_selecionada = 0;
    }
}

conversation = [
    ["NPC", "cu sujo?"],
    ["RESPOSTA", "????", 0, ["QUE NOJO!", "...", "sempre"]],
    ["NPC", "Obrigado pela resposta!"]
];
