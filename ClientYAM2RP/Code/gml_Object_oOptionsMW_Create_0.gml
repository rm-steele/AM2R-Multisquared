global.curropt = 0;
lastitem = 3;
active = 0;
editing = 0;
editingoption = 0;
alarm[0] = 5;
i = 0;

repeat (4)
{
    global.canedit[i] = 1;
    i += 1;
}

timer = 0;
event_user(0);
tip[0] = "Slot name for MW server";
tip[1] = "Password for MW server";
tip[2] = "Connect to MW python client";
tip[3] = get_text("GlobalOptions", "ExitMain_Tip");
global.tiptext = tip[global.curropt];

ini_open("multiworld/mw_settings.ini");
global.slotName = ini_read_string("Connector", "SlotName", "SlotName");
global.slotPass = ini_read_string("Connector", "SlotPass", "");
ini_close();
op[1].optext = global.slotName;
op[2].optext = global.slotPass;