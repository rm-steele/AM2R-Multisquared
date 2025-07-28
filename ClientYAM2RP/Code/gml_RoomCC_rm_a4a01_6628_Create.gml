if (oControl.mod_randomgamebool == 1 && oControl.mod_previous_room == 215 && global.inventory[8] == 0)
    instance_destroy();
else
    link_tile(56, 32, 80);

regentime = -1;
