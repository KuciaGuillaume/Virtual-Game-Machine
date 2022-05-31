
function CreateRound(OBJECT_TAG, TEXT_NAME, FONT, LAYER1, LAYER2, COLOR, MARGE, OPTION) {
	
	var my = GetObject(OBJECT_TAG);
	
	if (my == "NULL" || my.TAG != OBJECT_TAG)
		return "NULL";
	var TEXT = AddText(my.x, my.y - 35, TEXT_NAME, FONT, c_white, LAYER2, TEXT_NAME, OPTION);
	var X = (TEXT.x - (string_width(TEXT.TEXT) / 2)) - MARGE;
	var Y = (TEXT.y - (string_height(TEXT.TEXT) / 2)) - (MARGE / 2);
	var roundRect = CreateObjects(X, Y, LAYER1, Osimple_round, "ROUND", TEXT_NAME, OPTION);
	roundRect.image_alpha = 0;
	TEXT.image_alpha = 0;
	roundRect.BBOX_X = (X + TEXT.TEXT_WIDTH) + MARGE;
	roundRect.BBOX_Y = (Y + TEXT.TEXT_HEIGHT) + MARGE;
	roundRect.COLOR = COLOR;
	roundRect.TEXT_CONNECT = TEXT;
	roundRect.MARGE = MARGE;
	return roundRect;
}

function CreateEmptyRound(X, Y, COLOR, SIZE_X, SIZE_Y, LAYER, TAG, OPTION) {
	var rounded = GetObject(TAG);
	if (rounded != "NULL") {
		rounded.x = X; rounded.y = Y;
		rounded.COLOR = COLOR;
		rounded.SIZE_X = SIZE_X;
		rounded.SIZE_Y = SIZE_Y;
		return rounded;
	}
	rounded = CreateObjects(X, Y, LAYER, OEmptyRound, "IMAGE", TAG, OPTION);
	rounded.COLOR = COLOR;
	rounded.SIZE_X = SIZE_X;
	rounded.SIZE_Y = SIZE_Y;
	return rounded;
}

function DestroyRound(TEXT_NAME) {
	DestroyObject(TEXT_NAME);
	DestroyText(TEXT_NAME);
}
