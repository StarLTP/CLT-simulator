//Deve ser colocado toda sala (que pode ser pausada)
global.pause = false;

//opçoes
pause_opcoes = ["Salvar Jogo", "Opções", "Sair"];
pause_op_max = array_length(pause_opcoes);
pause_index = 0;

pause_estado = "menu"; // ou "salvar"

pause_salvar_index = 0;
pause_salvar_slots = scr_gerar_lista_slots();
