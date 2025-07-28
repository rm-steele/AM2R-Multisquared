ini_open("multiworld/mw_settings.ini");
ini_write_string("Connector", "SlotName", global.slotName);
ini_write_string("Connector", "SlotPass", global.slotPass);
ini_close();

event_user(1);
