/// @Project by Kucia Guillaume* ///

if (TAG == undefined)
	return;
if (!FIRST_PASS && !FADE_IN) {image_alpha = 2; FIRST_PASS = true; } 


// FADE_IN

if (FADE_IN && image_alpha < 1)
	image_alpha += FADE_POWER * delta_time;
else
	FADE_IN = false;

if (IMAGE_WIDTH < 0) {
	IMAGE_WIDTH = sprite_width;
	IMAGE_HEIGHT = sprite_height;
}

if (TIMER_OUT) {
	TIMER_DELTA += delta_time / 1000000;
	if (TIMER_DELTA >= TIMER_TIME) {
		TIMER_STATE_END = true;
		image_alpha -= 0.00001 * delta_time;
		y += 0.00001 * delta_time;
		if (TEXT_CONNECT != undefined) {
			TEXT_CONNECT.image_alpha = image_alpha;
			TEXT_CONNECT.y = y;
		}
		if (image_alpha <= 0) {
			if (PARENT != undefined) {
				if (string_count("WARNING", TAG)) {
					PARENT.WINDOW.list_objects = remove_findlist(PARENT.WARNING_GUI, PARENT.WINDOW.list_objects);
					PARENT.WARNING_GUI = undefined;
				}
			}
			if (TEXT_CONNECT != undefined)
				DestroyText(TEXT_CONNECT.TAG);
			DestroyObject(TAG);
			return;
		}
	}
}

if (SLIDE && !TIMER_STATE_END && image_alpha < 1 && ON) {
	y -= SLIDE_POWER * delta_time;
	if (TEXT_CONNECT != undefined)
		TEXT_CONNECT.y -= SLIDE_POWER * delta_time;
} else if (image_alpha >= 1 && SLIDE)
	SLIDE_OUT = true;

// GUI SELECT
if (TAG == "GUI_SELECT_BACKGROUNDS") {

	var scroll_bar = GetObject("SCROLL_IMAGE_BAR");
	var Title = GetText("BACKGROUND_TITLE");
	var Description = GetText("BACKGROUND_DESCRIPTION");
	var button = GetObject("BACKGROUND_SELECTOR");

	if (MouseInside(bbox_left, bbox_right, bbox_top, bbox_top + 473)) {
		if (mouse_wheel_down() && image_alpha >= 1 && BACKGROUND_OBJECTIVE < 1892 && Diff(0, (IMAGE_TOP - (473 * TARGET_INDEX))) < 20) {
			BACKGROUND_OBJECTIVE += 473;
			TARGET_INDEX += 1;
		}
		if (mouse_wheel_up() && image_alpha >= 1 && BACKGROUND_OBJECTIVE > 0 && Diff(0, (IMAGE_TOP - (473 * TARGET_INDEX))) < 20) {
			BACKGROUND_OBJECTIVE -= 473;
			TARGET_INDEX -= 1;
		}
		if (scroll_bar.image_alpha < 1)
			scroll_bar.image_alpha += 0.000005 * delta_time;
		if (scroll_bar.x < 540)
			scroll_bar.x += 0.00005 * delta_time;
		B_INSIDE = true;
	} else {
		if (scroll_bar.image_alpha > 0) {
			scroll_bar.image_alpha -= 0.000005 * delta_time;
			if (scroll_bar.x > 520)
				scroll_bar.x -= 0.00005 * delta_time;
		}
		B_INSIDE = false;
	}
	
	scroll_bar.image_index = TARGET_INDEX;
	
	if (IMAGE_TOP > BACKGROUND_OBJECTIVE)
		IMAGE_TOP -= (Diff(IMAGE_TOP, BACKGROUND_OBJECTIVE) * 0.000005) * delta_time;
	else if (IMAGE_TOP < BACKGROUND_OBJECTIVE)
		IMAGE_TOP += (Diff(IMAGE_TOP, BACKGROUND_OBJECTIVE) * 0.000005) * delta_time;

	// SET TEXT
	if (TARGET_INDEX == 0)
	{
		TITLE = "Windows 11 wallpaper";
		DESCRIPTION = "On June 15, 2021, nine days before the operating\nsystem was unveiled to the general public\nan internal build of the operating system\n(namely build 21996) was shared onto the Internet.\nIt introduced an entirely new wallpaper\nset consisting of CGI wallpapers, all of which are\nin 3840x2400 (or similar) as opposed to the 1920x1200 used\nin earlier versions, as 4K displays\nare more widespread now. Along with having default wallpapers\nfor both light and dark modes, there are four themes with\nfour wallpapers in each of them. Six N. Five\nhave confirmed themselves as the creators of\nthe two default wallpapers, as well as theme wallpapers\nalthough it is uncertain if they created all of those. XK studio\nare also known to have created the wallpapers\nof the Captured Motion theme.";
	}
	if (TARGET_INDEX == 4)
	{
		TITLE = "Ubuntu";
		DESCRIPTION = "Ubuntu is a Linux distribution based on Debian and\ncomposed mostly of free and open-source software.\nUbuntu is officially released in three editions:\nDesktop, Server, and Core for Internet of things devices\nand robots. All the editions can run on the computer alone\nor in a virtual machine. Ubuntu is a popular operating\nsystem for cloud computing, with support for OpenStack\nUbuntu's default desktop has been GNOME since version 17.10.";
	}
	if (TARGET_INDEX == 3)
	{
		TITLE = "Kali linux";
		DESCRIPTION = "Kali Linux is a Debian-derived Linux\ndistribution designed for digital forensics and\npenetration testing. It is maintained and funded by\nOffensive Security. Kali Linux has around 600\npenetration-testing programs (tools), including Armitage\n(a graphical cyber attack management tool), Nmap\n(a port scanner), Wireshark (a packet analyzer), metasploit\n(penetration testing framework), John the Ripper\n(a password cracker), sqlmap (automatic SQL\ninjection and database takeover tool), Aircrack-ng\n(a software suite for penetration-testing\nwireless LANs), Burp suite and OWASP ZAP web application\nsecurity scanners, etc.";
	}
	if (TARGET_INDEX == 2)
	{
		TITLE= "Win's Star wallpaper";
		DESCRIPTION = "Win's Start is the machine you are currently on!\nThe creation of the machine began in May 2022\nby Guillaume Kucia, who was then 19 years old\nYou should know that this\nmachine aims to look like the Windows OS while being\ndeveloped on a game engine! The goal here and\ntherefore to create a virtual machine that will\nact as a game environment.";
	}
	if (TARGET_INDEX == 1)
	{
		TITLE = "MacOs";
		DESCRIPTION = "macOS previously Mac OS X and later OS X) is\na Unix operating system developed and\nmarketed by Apple Inc. since 2001. It is the primary operating\nsystem for Apple's Mac computers. Within the market of desktop and\nlaptop computers it is the second most widely used\ndesktop OS, after Microsoft Windows\nand ahead of Chrome OS.macOS succeeded\nthe classic Mac OS, a Macintosh\noperating system with nine releases from 198\nto 1999. During this time, Apple cofounder Steve Jobs\nhad left Apple and started another company\nNeXT, developing the NeXTSTEP platform that would\nlater be acquired by\nApple to form the basis of macOS\nThe first desktop version, Mac OS X\n10.0, was released in March 2001, with\nits first update, 10.1,\narriving later that year.";
	}
	if (TARGET_INDEX == 5)
	{
		TITLE = "Wallpaper";
		DESCRIPTION = "This is a simple background";
	}

	button.image_alpha = image_alpha;
	button.TEXT_CONNECT.image_alpha = image_alpha;
	button.WALLPAPER_INDEX = TARGET_INDEX;
	
	Title.TEXT = TITLE;
	Description.TEXT = DESCRIPTION; Description.image_alpha = image_alpha - 0.3;
	return;
}


// USER BACKGROUND
if (TAG == "USER_BACKGROUND" && !SKIP) {
	USER_TIME += delta_time / 1000000;
	if (!FIRST_PASS || USER_TIME >= USER_TIMER) {
		USER_TIME = 0;
		FIRST_PASS = true;
		randomize();
		var i = random_range(0, 15);
		var all_negative = true;
		for (; i == image_index || global.USER[9][i] < 0;) {
			i = random_range(0, 15);
			for (var e = 0; e != 15; e++)
				if (global.USER[9][e] >= 0) { all_negative = false; }
			if (all_negative) { i = 0; break; }
				
		}
		image_index = i;
		var like = GetObject("LIKE");
		var dislike = GetObject("DISLIKE");
		if (like != undefined && dislike != undefined) {
			like.image_index = 0;
			dislike.image_index = 0;
		}
	}
	return;
} else if (TAG == "USER_BACKGROUND") {
	FIRST_PASS = true;
	SKIP = false;
	return;
}

if (TAG == "IMAGE_WIFI" && ON_USER_INPUT.MODE == 1) {
	var power_off = GetObject("POWER_OFF");
	if (x > 1815)
		x -= 0.0001 * delta_time;
	else if (power_off == undefined)
		CreateObjectSprite(1866, 1041.15, "Gp2", Spower_off, Obox, "BUTTON-NO-HAND", "POWER_OFF", [["INFO", AutoLanguage("Power-off")], ["FADE_IN", 0.000001], undefined]);
	return;
}

if (TAG == "POWER_OPTION") {
	if (y > 912)
		y -= 0.0001 * delta_time;
	return;
}

if (TAG == "SYSTEM_LOAD") {
	image_xscale = 0.5;
	image_yscale = 0.5;
	SYSTEM_LOAD_TIME += delta_time / 1000000;
	if (SYSTEM_LOAD_TIME >= 3)
		room = RMainScene;
	return;
}

if (CLOSE) DestroyObject(TAG);

if (OBJECT_LINKED != undefined) {
	OBJECT_LINKED.x = x;
	OBJECT_LINKED.y = y;
}

// CHECKER
if (string_count("CHECKER_BAR_2", TAG)) {
	IMAGE_WIDTH = PARENT.x - x;
}

// FOLDER MOVEMENT
if (GET_FOLDER == undefined && (string_count("FOLDERS", TAG) > 0))
	GET_FOLDER = TAG;
if (GET_FOLDER != undefined) {
	
	if (mouse_check_button_pressed(mb_left) && MouseInsideObject(id)) {
		if (SAVE_CURRENT == 0)
			SAVE_CURRENT = current_time;
		else if ((current_time - SAVE_CURRENT < 200) && (WRITE == undefined || (WRITE != undefined && !WRITE.ON_WRITE)) && ON_MAIN_SCENE.ON_DESK) {
			SAVE_CURRENT = current_time;
			var desk = AutoLanguage("Desk");
			var window = CreateWindow(S_File_explorer_Bk, OJustGUI_File_explorer, "FILE_EXPLORER", S_File_explorer_icon, AutoLanguage("File_explorer"), Swindow_top);
			window.WINDOW_BK.PWD = go_to_path(ON_MAIN_SCENE.PATH, "/~/" + desk + "/" + TEXT_CONNECT.TEXT);
			window.WINDOW_BK.PWD_PATH = "/~/" + desk + "/" + TEXT_CONNECT.TEXT;
		} else
			SAVE_CURRENT = current_time;
	}

	// FOLDER NAME
	if (WRITE != undefined && WRITE.ON_WRITE) {
		var i = get_index_list(TEXT_CONNECT.TEXT, ON_MAIN_SCENE.NAME_FOLDERS);
		TEXT_CONNECT.TEXT = WRITE.TEXT_OUTPUT;
		ON_MAIN_SCENE.NAME_FOLDERS[i][0] = TEXT_CONNECT.TEXT;
		var PWD = ON_MAIN_SCENE.PATH[1];
		terminal_rename(["rename", ORIGINAL_NAME, TEXT_CONNECT.TEXT, undefined], undefined, PWD, undefined);
		ORIGINAL_NAME = WRITE.TEXT_OUTPUT;
		WRITE.BAR.y = TEXT_CONNECT.y;
		RENAME_OBJECT = CreateEmptyRound(OEmptyRound, TEXT_CONNECT.x - TEXT_CONNECT.TEXT_WIDTH/2 - 5, TEXT_CONNECT.y - TEXT_CONNECT.TEXT_HEIGHT/2 - 5, #262626, TEXT_CONNECT.TEXT_WIDTH + 10, TEXT_CONNECT.TEXT_HEIGHT + 10, "Gp0", TAG + "RENAME_ON_DESK", [undefined]);
		UpdateBar(WRITE.BAR, TEXT_CONNECT.TEXT_WIDTH, TEXT_CONNECT.x - TEXT_CONNECT.TEXT_WIDTH/2);
	} else if (TEXT_CONNECT != undefined) {
		if (TEXT_CONNECT.TEXT == "") {
			var i = get_index_list(TEXT_CONNECT.TEXT, ON_MAIN_SCENE.NAME_FOLDERS);
			TEXT_CONNECT.TEXT = MASTER_NAME;
			ON_MAIN_SCENE.NAME_FOLDERS[i][0] = TEXT_CONNECT.TEXT;
			var PWD = ON_MAIN_SCENE.PATH[1];
			terminal_rename(["rename", ORIGINAL_NAME, TEXT_CONNECT.TEXT, undefined], undefined, PWD, undefined);
			ORIGINAL_NAME = WRITE.TEXT_OUTPUT;
		}
		if (RENAME_OBJECT != undefined) {
			DestroyObject(TAG + "RENAME_ON_DESK");
			RENAME_OBJECT = undefined;
		}
		WRITE.INITIAL_TEXT = TEXT_CONNECT.TEXT;
		ORIGINAL_NAME = TEXT_CONNECT.TEXT;
		MASTER_NAME = TEXT_CONNECT.TEXT;
	}
	
	if (mouse_check_button_pressed(mb_left) || mouse_check_button_pressed(mb_right)) {
		if (!MouseInsideObject(id) && WRITE.ON_WRITE == true)
			WRITE.ON_WRITE = false;
	}

	
	// CHANGE FOLDER POSITION
	if (mouse_check_button(mb_left) && (MouseInsideObject(id) || GRABED)) {
		var cursor = GetObject("CURSOR");
		if (cursor.image_index == 3 || GRABED) {
			for (var i = 0; ON_MAIN_SCENE.FOLDERS[i] != undefined; i++)
				if (ON_MAIN_SCENE.FOLDERS[i].GRABED == true && ON_MAIN_SCENE.FOLDERS[i] != id) { layer = layer_get_id("Gp0"); TEXT_CONNECT.layer = layer_get_id("Gp1"); GRABED = false; return; }
			if (!GRABED) {
				TAKE_POS_X = x;
				TAKE_POS_Y = y;
			}
			GRABED = true;
			layer = layer_get_id("Gp2");
			TEXT_CONNECT.layer = layer_get_id("Gp3");
			x = mouse_x;
			y = mouse_y;
		}
	} else {
		if (GRABED) {
			var modulo_x = x % 100;
			var modulo_y = y % 100;
			if (modulo_x >= 50) { x = x + (100 - modulo_x) }
			if (modulo_x < 50) { x -= modulo_x }
			if (modulo_y >= 50) { y = y + (100 - modulo_y) }
			if (modulo_y < 50) { y -= modulo_y }
			for (var i = 0; ON_MAIN_SCENE.FOLDERS[i] != undefined; i++) {
				if ((y == ON_MAIN_SCENE.FOLDERS[i].y && x == ON_MAIN_SCENE.FOLDERS[i].x && ON_MAIN_SCENE.FOLDERS[i] != id) ||
				x > 1800 || x < 100 || y > 900 || y < 100) {
					x = TAKE_POS_X;
					y = TAKE_POS_Y;
				}
				if (ON_MAIN_SCENE.FOLDERS[i] != id) {
					ON_MAIN_SCENE.NAME_FOLDERS[i][1] = ON_MAIN_SCENE.FOLDERS[i].x;
					ON_MAIN_SCENE.NAME_FOLDERS[i][2] = ON_MAIN_SCENE.FOLDERS[i].y;
				} else {
					ON_MAIN_SCENE.NAME_FOLDERS[i][1] = x;
					ON_MAIN_SCENE.NAME_FOLDERS[i][2] = y;
				}
			}
			GRABED = false;
			layer = layer_get_id("Gp0");
			if (TEXT_CONNECT != undefined && instance_exists(TEXT_CONNECT))
				TEXT_CONNECT.layer = layer_get_id("Gp1");
		}
	}
	if (TEXT_CONNECT != undefined && instance_exists(TEXT_CONNECT)) {
		TEXT_CONNECT.x = x;
		TEXT_CONNECT.y = y + 40;
	}
	return;
}
