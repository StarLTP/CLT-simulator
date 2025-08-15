function Script7(){
/// (npc_id, texto)
var npc = instance_find(obj_npc_question, argument0);
npc.dialogue = argument1;
npc.talk_phase = "after_answer";
npc.talk_timer = room_speed;

}