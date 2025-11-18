newgamestr = get_text("Title", "GameSlot_NewGame");
title = get_save_title(saveroom);

if (saveexists == 1)
{
    if (sdifficulty == 0)
        difftext = get_text("Title", "GameSlot_Easy");
    
    if (sdifficulty == 1)
        difftext = get_text("Title", "GameSlot_Normal");
    
    if (sdifficulty == 2)
        difftext = get_text("Title", "GameSlot_Hard");
    
    if (sdifficulty == 3)
        difftext = get_text("Title-Additions", "GameSlot_NewGame_Fusion");
    
    if (smode == 3)
        modeindex = get_text("Title-Additions", "GameSlot_NewGame_ClassicMode");
    
    if (smode == 4)
        modeindex = get_text("Title-Additions", "GameSlot_NewGame_AM2Random");
    
    if (smode == 5)
        modeindex = get_text("Title-Additions", "GameSlot_NewGame_SplitRandom");
}

var postfix = "";
switch (2 * oControl.mod_insanitymode + sfusion)
{
    case 0: // neither insanity nor fusion mode
        mycolor = make_color_rgb(3, 187, 25);
        break;
    case 1: // just fusion mode
        postfix = "F";
        mycolor = make_color_rgb(15, 145, 214);
        break;
    case 2: // just insanity mode
        postfix = "Insanity";
        mycolor = make_color_rgb(187, 3, 3);
        break;
    case 3: // both insanity and fusion mode
        postfix = "InsanityF";
        mycolor = make_color_rgb(135, 76, 255);
        break;
}

myslotbg = asset_get_index("bgSaveSlot" + postfix);
myslot = asset_get_index("sSaveSlot" + postfix);
myslotb = asset_get_index("sSaveSlotB" + postfix);
myslotc = asset_get_index("sSaveSlotCopy" + postfix);

postfix = "";
if (oControl.mod_monstersextremecheck) postfix += "ELM";
if (sfusion) postfix += "F";
meticon = asset_get_index("bgGUIMetCountBG2" + postfix);