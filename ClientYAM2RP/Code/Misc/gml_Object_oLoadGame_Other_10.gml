if (global.lobbyLocked && global.lastroom != 2)
{
    if (global.revived)
    {
        global.revived--;
        global.spectator = 0;
    }
    else
    {
        global.spectator = 1;
    }
    
    global.spectatorIndex = -1;
    
    if (global.sax)
    {
        global.spectator = 0;
        global.spectatorIndex = -1;
    }
    
    global.mosaic = 0;
}

global.beingAbsorbed = 0;
global.absorbDone = 0;

if (global.newgame == 1)
    start_new_game();
else
    load_game(global.savedirectory + string(global.saveslot + 1));
