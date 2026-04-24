server = network_create_server_raw(network_socket_tcp, 64197, 1);
socket = -4;
load_character_vars();

ini_open("multiworld/mw_settings.ini");
global.slotName = ini_read_string("Connector", "SlotName", "SlotName");
global.slotPass = ini_read_string("Connector", "SlotPass", "");
ini_close();

trapPopups = true;
