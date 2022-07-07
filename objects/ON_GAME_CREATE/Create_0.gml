/// @Project by Kucia Guillaume* ///


// CREATE GLOBAL WINDOW LAYER
global.layer_depth = [undefined];
global.last_layer_id = 5000;

// CREATE ALL OBJECTS STOCKAGE

CLASS = [undefined, undefined, room];
global.OBJECTS = [undefined];
global.BUTTONS = [undefined];

// CREATE GLOBAL WRITE

global.WRITE = [undefined];

// CREATE GLOBAL TEXT

global.TEXT = [undefined];

// CREATE GLOBAL START STATE VARIABLES

global.RstartMode = "START";

// INIT_TIMER

global.TIMER = 1;

// PATH AND FOLDERS

global.PATH = undefined;
global.FOLDERS = [undefined];

// WINDOW'S PIN

global.WINDOWS_PIN = [undefined];


// CREATE DATE
global.DATE = {
	DAY : undefined,
	MONTH : undefined,
	YEAR : undefined,
	TIME : [undefined, undefined]
};

// CREATE USERS VARAIBLES

STATE = undefined;
FIRST_NAME = "NULL";
LAST_NAME = "NULL";
EMAIL = "NULL";
AGE = "NULL";
PASSWORD = "NULL";
ICON = [undefined, -1];
BACKGROUND = -1;
HELPING_PASSWORD = "NULL";
LIKE_LIST = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

global.USER = [STATE, FIRST_NAME, LAST_NAME, EMAIL, AGE, PASSWORD, ICON, BACKGROUND, HELPING_PASSWORD, LIKE_LIST];

// CREATE LOAD_LIST

LOAD_LIST = [global.USER, global.PATH, global.FOLDERS, global.WINDOWS_PIN, undefined];

// LOAD
LOAD_LIST = savegame_load("USER", LOAD_LIST);
global.USER = LOAD_LIST[0];
global.PATH = LOAD_LIST[1];
global.FOLDERS = LOAD_LIST[2];
global.WINDOWS_PIN = LOAD_LIST[3];



// LOAD GAME
room = RMainScene;
