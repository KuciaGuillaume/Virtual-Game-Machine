// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function addtolist(OBJECT, LIST) {
	
	for (var i = 0; LIST[i] != undefined; ) { i++; }
	LIST[i] = OBJECT;
	LIST[i + 1] = undefined;
	return LIST;
}

function addtolistspec(OBJECT, LIST, SPEC) {
	
	for (var i = 0; LIST[i] != SPEC; ) { i++; }
	LIST[i] = OBJECT;
	LIST[i + 1] = SPEC;
	return LIST;
}

function addtolistnum(OBJECT, LIST, NUM) {
	
	for (var i = 0; i != NUM; ) { i++; }
	LIST[i] = OBJECT;
	LIST[i + 1] = undefined;
	return LIST;
}

function remove_list(i, LIST) {
	
	for (; LIST[i] != undefined; i++)
		LIST[i] = LIST[i + 1];
	return LIST;
}

function remove_findlist(FIND, LIST) {
	
	for (var i = 0; LIST[i] != undefined && FIND != LIST[i];) { i++; }
	if (LIST[i] == undefined)
		return LIST;
	for (; LIST[i] != undefined; i++)
		LIST[i] = LIST[i + 1];
	return LIST;
}

function remove_findlist_index(FIND, LIST, index) {
	
	for (var i = 0; LIST[i] != undefined && FIND != LIST[i][index];) { i++; }
	if (LIST[i] == undefined)
		return LIST;
	for (; LIST[i] != undefined; i++)
		LIST[i] = LIST[i + 1];
	return LIST;
}

function list_n(LIST) {
	var i = 0;
	for (; LIST[i] != undefined;) { i++ }
	return i;
}

function addtolist_limited(OBJECT, LIST, MAX) {
	
	for (var i = 0; LIST[i] != undefined && i != MAX; ) { i++; }
	if (i != MAX) {
		LIST[i] = OBJECT;
		LIST[i + 1] = undefined;
	} else {
		for (var e = 0; e != i; e++)
			LIST[e] = LIST[e + 1];
		e--;
		LIST[e] = OBJECT;
	}
	return LIST;
}

function FindListIndex(OBJECT, ARRAY, INDEX) {
	for (var i = 0; ARRAY[i] != undefined; i++)
		if (ARRAY[i][INDEX] == OBJECT)
			return i;
	return false;
}