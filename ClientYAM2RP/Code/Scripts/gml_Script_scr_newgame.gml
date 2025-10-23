oControl.mod_purerandombool = 0;
oControl.mod_randomgamebool = 0;
oControl.mod_splitrandom = 0;

if (global.gamemode == 2 || global.gamemode == 3 || global.gamemode == 4 || global.gamemode == 5)
{
    global.lavastate = 10;
    global.event[0] = 1; // first alpha cutscene
    global.event[4] = 1;
    global.event[56] = 1;
    global.event[109] = 1; // first gamma cutscene
    global.event[155] = 1;
    global.event[172] = 3; // mines drill sequence
    global.event[173] = 1;
    global.event[204] = 1;
    global.event[205] = 1; // first zeta cutscene
    global.event[259] = 1;
    global.event[300] = 1; // first omega cutscene
    //global.event[302] = 1; // labs egg cutscene
    global.event[305] = 1;
    global.monstersarea = 43;
    
    if (global.gamemode == 3)
        scr_randomizer();
    
    if (global.gamemode == 4)
    {
        oControl.mod_purerandombool = 1;
        scr_randomizer_pure();
    }
    
    if (global.gamemode == 5)
    {
        oControl.mod_splitrandom = 1;
        scr_rand_split_powerups();
        scr_randomizer_split_items();
    }
}
else
{
    global.gamemode = 1;
}

global.monstersleft = 47;
