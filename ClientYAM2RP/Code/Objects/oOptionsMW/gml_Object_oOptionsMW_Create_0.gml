global.curropt = 0;
lastitem = 4;
active = 0;
editing = 0;
editingoption = 0;
alarm[0] = 5;
i = 0;

repeat (5)
{
    global.canedit[i] = 1;
    i += 1;
}

timer = 0;
event_user(0);
tip[0] = "Slot name for MW server";
tip[1] = "Password for MW server";
tip[2] = "Use a font with distinct uppercase and lowercase letters";
tip[3] = "Connect to MW python client";
tip[4] = get_text("GlobalOptions", "ExitMain_Tip");
global.tiptext = tip[global.curropt];

ini_open("multiworld/mw_settings.ini");
global.slotName = ini_read_string("Connector", "SlotName", "SlotName");
global.slotPass = ini_read_string("Connector", "SlotPass", "");
global.opmwcasesensitive = ini_read_real("General", "CaseSensitiveFont", 0);
ini_close();
op[1].optext = global.slotName;
op[2].optext = global.slotPass;
if (global.opmwcasesensitive)
    op[3].optext = "Yes";
else
    op[3].optext = "No";