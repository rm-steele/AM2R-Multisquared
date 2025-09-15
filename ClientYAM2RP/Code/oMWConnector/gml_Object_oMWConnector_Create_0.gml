var type = 0;
server = network_create_server_raw(type, 64197, 1);
socket = -4;
load_character_vars();

ini_open("multiworld/mw_settings.ini");
global.slotName = ini_read_string("Connector", "SlotName", "SlotName");
global.slotPass = ini_read_string("Connector", "SlotPass", "");
ini_close();
