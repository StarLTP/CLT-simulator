var _grid = global.grid_profundidade;
var _num = instance_number(par_obj);

ds_grid_resize(_grid, 2, _num);
var i = 0;
with(par_obj){
	_grid[# 0, i] = id;
	_grid[# 1, i] = y;
	i++
}	

ds_grid_sort(_grid, 1, true);

for (var i = 0; i < ds_grid_height(_grid); i++){
	var _inst = _grid[# 0, i];
	with(_inst){
		draw_self();
		event_perform(ev_draw, 0);
	}
}