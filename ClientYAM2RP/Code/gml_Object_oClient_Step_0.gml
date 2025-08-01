if (!connected)
{
    if (isConnected >= 0)
    {
        connected = 1;
        global.TryConnect = 0;
        popup_text("Connected");
        buffer_delete(buffer);
        var size = 1024;
        var type = 1;
        var alignment = 1;
        buffer = buffer_create(size, type, alignment);
        buffer_seek(buffer, buffer_seek_start, 0);
        buffer_write(buffer, buffer_u8, 1);
        buffer_write(buffer, buffer_string, name + "," + global.multitroid_version);
        buffer_write(buffer, buffer_u8, global.sax);
        var bufferSize = buffer_tell(buffer);
        buffer_seek(buffer, buffer_seek_start, 0);
        buffer_write(buffer, buffer_s32, bufferSize);
        buffer_write(buffer, buffer_u8, 1);
        buffer_write(buffer, buffer_string, name + "," + global.multitroid_version);
        buffer_write(buffer, buffer_u8, global.sax);
        var result = network_send_packet(socket, buffer, buffer_tell(buffer));
        instance_create(x, y, oNametag);
    }
    else
    {
        instance_destroy();
        global.TryConnect = 0;
        popup_text("Failed to connect");
    }
}

if (global.event[103] > 0)
    global.event[103] = floor(global.event[103]);

if (global.event[303] > 0)
    phase = 0;

if (global.event[172] != 3)
    global.event[172] = 3;

if (global.gamemode > 1 || global.saxmode)
{
    if (global.gamemode == 1)
        global.gamemode = 2;
    
    if (global.lavastate < 7)
        global.lavastate = 7;
}

if (room == rm_death)
{
    phase = 0;
    queenHealth = global.mod_queenHstart + (global.mtanks * 10);
}

if ((room == rm_a4b02 || room == rm_a4b03 || room == rm_a4b04 || room == rm_a4b05 || room == rm_a4b06 || room == rm_a4b07 || room == rm_a4b08 || room == rm_a4b09 || room == rm_a4b10 || room == rm_a4b11 || room == rm_a4b12 || room == rm_a4b13 || room == rm_a4b14 || room == rm_a4b15 || room == rm_a4b16 || room == rm_a4b17 || room == rm_a4b18 || room == rm_a4b19) && global.event[203] > 0 && global.event[203] < 9 && !instance_exists(oA4EscapeControl))
    instance_create(x, y, oA4EscapeControl);

if (room == rm_a4b01 && global.event[203] == 9 && instance_exists(oA4EscapeControl))
{
    with (oA4EscapeControl)
        event_user(0);
}

if (global.event[203] == 9 && sfx_isplaying(296))
    sfx_stop(296);

if (!instance_exists(oQueen) && global.event[303] == 0)
{
    if (!queenHealthResetQueued)
    {
        queenHealthResetQueued = 1;
        alarm[1] = 5;
    }
}

if (instance_exists(oQueen) && !is_undefined(oQueen.phase))
{
    if (global.event[303] > 0 && !queenDead)
    {
        with (oQueen)
        {
            state = 100;
            statetime = 0;
            mus_fadeout(291);
            mus_fadeout(345);
            mus_fadeout(347);
            mus_fadeout(346);
            mus_fadeout(290);
        }
        
        queenDead = 1;
    }
    
    if (instance_exists(oQueenHead))
    {
        with (oQueenHead)
        {
            if (oQueen.phase > 3 && instance_exists(147762))
            {
                oQueen.phase = 3;
                
                if (head_damage == 2)
                    head_damage = 1;
            }
        }
    }
}

if (keyboard_check_pressed(vk_f2))
{
    sfx_play(188);
    instance_destroy();
}

if (keyboard_check_pressed(vk_f4))
{
    if (oControl.showname == "disabled")
        oControl.showname = "enabled";
    
    if (oControl.showname == "enabled")
        oControl.showname = "disabled";
}

if (instance_exists(oCharacter))
{
    posX = global.mapposx;
    posY = global.mapposy;
}

if ((room == rm_a4b02 || room == rm_a4b03 || room == rm_a4b04 || room == rm_a4b05 || room == rm_a4b06 || room == rm_a4b07 || room == rm_a4b08 || room == rm_a4b09 || room == rm_a4b10 || room == rm_a4b11 || room == rm_a4b12 || room == rm_a4b13 || room == rm_a4b14 || room == rm_a4b15 || room == rm_a4b16 || room == rm_a4b17 || room == rm_a4b18 || room == rm_a4b19) && global.event[203] == 9 && !teleport)
{
    teleport = 1;
    global.targetx = 624;
    global.targety = 144;
    room_change(216, 1);
}

if (instance_exists(oCharacter) && (oCharacter.state == oCharacter.SAVINGFX || oCharacter.state == oCharacter.SAVINGSHIPFX || oCharacter.state == oCharacter.SAVINGSHIP))
    refill_heath_ammo();

if (oControl.mod_monstersextremecheck == 1 && oControl.mod_monstersextreme == 0 && global.event[302] > 0)
    oControl.mod_monstersextreme = 1;
else if (oControl.mod_monstersextremecheck == 0 && oControl.mod_monstersextreme == 1)
    oControl.mod_monstersextreme = 0;

if (global.log[21] > 0 && global.event[309] == 0)
    global.event[309] = 1;

if (global.event[309] == 1 && global.log[21] < 1)
    global.log[21] = 1;

if (time == 0 && connected && instance_exists(id))
{
    if (ds_list_size(global.idList) > 0)
    {
        checkListID = ds_list_create();
        
        for (var i = 0; i < ds_list_size(global.idList); i++)
        {
            var arr = ds_list_find_value(global.idList, i);
            ds_list_add(checkListID, arr[0, 0]);
        }
        
        for (var i = 0; i < ds_list_size(roomList); i++)
        {
            var ID = ds_list_find_value(roomList, i);
            var findID = ds_list_find_index(checkListID, ID);
            
            if (findID < 0)
                ds_list_delete(roomList, i);
        }
        
        for (var i = 0; i < ds_list_size(roomListData); i++)
        {
            var arr = ds_list_find_value(roomListData, i);
            var findID = ds_list_find_index(checkListID, arr[0]);
            
            if (findID < 0)
                ds_list_delete(roomListData, i);
        }
        
        for (var i = 0; i < ds_list_size(posData); i++)
        {
            var arr = ds_list_find_value(posData, i);
            var findID = ds_list_find_index(checkListID, arr[0]);
            
            if (findID < 0)
                ds_list_delete(posData, i);
        }
        
        for (var i = 0; i < ds_list_size(global.otherPlayerItems); i++)
        {
            var arr = ds_list_find_value(global.otherPlayerItems, i);
            var findID = ds_list_find_index(checkListID, arr[0]);
            
            if (findID < 0)
                ds_list_delete(global.otherPlayerItems, i);
        }
        
        ds_list_destroy(checkListID);
    }
    
    time = 60;
}

if (maxpbombsTimer == 0 && connected && !is_on_menu() && (!global.spectator || global.sax))
{
    if (global.maxpbombsPrev != global.maxpbombs)
    {
        buffer_delete(buffer);
        var size = 1024;
        var type = 1;
        var alignment = 1;
        buffer = buffer_create(size, type, alignment);
        buffer_seek(buffer, buffer_seek_start, 0);
        buffer_write(buffer, buffer_u8, 13);
        buffer_write(buffer, buffer_u8, global.maxpbombs);
        buffer_write(buffer, buffer_u8, global.clientID);
        var bufferSize = buffer_tell(buffer);
        buffer_seek(buffer, buffer_seek_start, 0);
        buffer_write(buffer, buffer_s32, bufferSize);
        buffer_write(buffer, buffer_u8, 13);
        buffer_write(buffer, buffer_u8, global.maxpbombs);
        buffer_write(buffer, buffer_u8, global.clientID);
        var result = network_send_packet(socket, buffer, buffer_tell(buffer));
        maxpbombsChanged = 1;
    }
    
    if (!maxpbombsChanged)
        maxpbombsTimer = 10;
    
    if (maxpbombsChanged)
    {
        maxpbombsChanged = 0;
        maxpbombsTimer = 75;
    }
}

if (maxhealthTimer == 0 && connected && !is_on_menu() && (!global.spectator || global.sax))
{
    if (global.maxhealthPrev != global.maxhealth)
    {
        buffer_delete(buffer);
        var size = 1024;
        var type = 1;
        var alignment = 1;
        buffer = buffer_create(size, type, alignment);
        buffer_seek(buffer, buffer_seek_start, 0);
        buffer_write(buffer, buffer_u8, 14);
        buffer_write(buffer, buffer_u16, global.maxhealth);
        buffer_write(buffer, buffer_u8, global.clientID);
        var bufferSize = buffer_tell(buffer);
        buffer_seek(buffer, buffer_seek_start, 0);
        buffer_write(buffer, buffer_s32, bufferSize);
        buffer_write(buffer, buffer_u8, 14);
        buffer_write(buffer, buffer_u16, global.maxhealth);
        buffer_write(buffer, buffer_u8, global.clientID);
        var result = network_send_packet(socket, buffer, buffer_tell(buffer));
        maxhealthChanged = 1;
    }
    
    if (!maxhealthChanged)
        maxhealthTimer = 10;
    
    if (maxhealthChanged)
    {
        maxhealthChanged = 0;
        maxhealthTimer = 75;
    }
}

if (etanksTimer == 0 && connected && !is_on_menu() && (!global.spectator || global.sax))
{
    if (global.etanksPrev != global.etanks)
    {
        buffer_delete(buffer);
        var size = 1024;
        var type = 1;
        var alignment = 1;
        buffer = buffer_create(size, type, alignment);
        buffer_seek(buffer, buffer_seek_start, 0);
        buffer_write(buffer, buffer_u8, 15);
        buffer_write(buffer, buffer_u8, global.etanks);
        buffer_write(buffer, buffer_u8, global.clientID);
        var bufferSize = buffer_tell(buffer);
        buffer_seek(buffer, buffer_seek_start, 0);
        buffer_write(buffer, buffer_s32, bufferSize);
        buffer_write(buffer, buffer_u8, 15);
        buffer_write(buffer, buffer_u8, global.etanks);
        buffer_write(buffer, buffer_u8, global.clientID);
        var result = network_send_packet(socket, buffer, buffer_tell(buffer));
        etanksChanged = 1;
    }
    
    if (!etanksChanged)
        etanksTimer = 10;
    
    if (etanksChanged)
    {
        etanksChanged = 0;
        etanksTimer = 75;
    }
}

if (mtanksTimer == 0 && connected && !is_on_menu() && (!global.spectator || global.sax))
{
    if (global.mtanksPrev != global.mtanks)
    {
        buffer_delete(buffer);
        var size = 1024;
        var type = 1;
        var alignment = 1;
        buffer = buffer_create(size, type, alignment);
        buffer_seek(buffer, buffer_seek_start, 0);
        buffer_write(buffer, buffer_u8, 16);
        buffer_write(buffer, buffer_u8, global.mtanks);
        buffer_write(buffer, buffer_u8, global.clientID);
        var bufferSize = buffer_tell(buffer);
        buffer_seek(buffer, buffer_seek_start, 0);
        buffer_write(buffer, buffer_s32, bufferSize);
        buffer_write(buffer, buffer_u8, 16);
        buffer_write(buffer, buffer_u8, global.mtanks);
        buffer_write(buffer, buffer_u8, global.clientID);
        var result = network_send_packet(socket, buffer, buffer_tell(buffer));
        mtanksChanged = 1;
    }
    
    if (!mtanksChanged)
        mtanksTimer = 10;
    
    if (mtanksChanged)
    {
        mtanksChanged = 0;
        mtanksTimer = 75;
    }
}

if (stanksTimer == 0 && connected && !is_on_menu() && (!global.spectator || global.sax))
{
    if (global.stanksPrev != global.stanks)
    {
        buffer_delete(buffer);
        var size = 1024;
        var type = 1;
        var alignment = 1;
        buffer = buffer_create(size, type, alignment);
        buffer_seek(buffer, buffer_seek_start, 0);
        buffer_write(buffer, buffer_u8, 17);
        buffer_write(buffer, buffer_u8, global.stanks);
        buffer_write(buffer, buffer_u8, global.clientID);
        var bufferSize = buffer_tell(buffer);
        buffer_seek(buffer, buffer_seek_start, 0);
        buffer_write(buffer, buffer_s32, bufferSize);
        buffer_write(buffer, buffer_u8, 17);
        buffer_write(buffer, buffer_u8, global.stanks);
        buffer_write(buffer, buffer_u8, global.clientID);
        var result = network_send_packet(socket, buffer, buffer_tell(buffer));
        stanksChanged = 1;
    }
    
    if (!stanksChanged)
        stanksTimer = 10;
    
    if (stanksChanged)
    {
        stanksChanged = 0;
        stanksTimer = 75;
    }
}

if (ptanksTimer == 0 && connected && !is_on_menu() && (!global.spectator || global.sax))
{
    if (global.ptanksPrev != global.ptanks)
    {
        buffer_delete(buffer);
        var size = 1024;
        var type = 1;
        var alignment = 1;
        buffer = buffer_create(size, type, alignment);
        buffer_seek(buffer, buffer_seek_start, 0);
        buffer_write(buffer, buffer_u8, 18);
        buffer_write(buffer, buffer_u8, global.ptanks);
        buffer_write(buffer, buffer_u8, global.clientID);
        var bufferSize = buffer_tell(buffer);
        buffer_seek(buffer, buffer_seek_start, 0);
        buffer_write(buffer, buffer_s32, bufferSize);
        buffer_write(buffer, buffer_u8, 18);
        buffer_write(buffer, buffer_u8, global.ptanks);
        buffer_write(buffer, buffer_u8, global.clientID);
        var result = network_send_packet(socket, buffer, buffer_tell(buffer));
        ptanksChanged = 1;
    }
    
    if (!ptanksChanged)
        ptanksTimer = 10;
    
    if (ptanksChanged)
    {
        ptanksChanged = 0;
        ptanksTimer = 75;
    }
}

if (hpAmmoSyncTimer <= 0 && connected && !is_on_menu() && (!global.spectator || global.sax))
{
    if (global.playerhealthPrev != global.playerhealth || global.missilesPrev != global.missiles || global.smissilesPrev != global.smissiles || global.pbombsPrev != global.pbombs)
    {
        buffer_delete(buffer);
        buffer = buffer_create(1024, buffer_grow, 1);
        buffer_seek(buffer, buffer_seek_start, 0);
        buffer_write(buffer, buffer_s32, 9);
        buffer_write(buffer, buffer_u8, 102);
        buffer_write(buffer, buffer_s16, global.playerhealthPrev - global.playerhealth);
        buffer_write(buffer, buffer_s16, global.missilesPrev - global.missiles);
        buffer_write(buffer, buffer_s16, global.smissilesPrev - global.smissiles);
        buffer_write(buffer, buffer_s16, global.pbombsPrev - global.pbombs);
        buffer_poke(buffer, 0, buffer_s32, buffer_tell(buffer) - 4);
        buffer_tell(buffer);
        network_send_packet(socket, buffer, buffer_tell(buffer));
    }
    
    hpAmmoSyncTimer = 30;
    global.playerhealthPrev = global.playerhealth;
    global.missilesPrev = global.missiles;
    global.smissilesPrev = global.smissiles;
    global.pbombsPrev = global.pbombs;
}

if (teleport)
{
    teleportTimer--;
    
    if (teleportTimer <= 0)
    {
        teleport = 0;
        teleportTimer = 60;
    }
}

if (disconnectTimer <= 0)
    instance_destroy();

if (pingTimer <= 0)
{
    pingTimer = 5;
    buffer_delete(buffer);
    var size = 1024;
    var type = 1;
    var alignment = 1;
    buffer = buffer_create(size, type, alignment);
    buffer_seek(buffer, buffer_seek_start, 0);
    buffer_write(buffer, buffer_u8, 103);
    buffer_write(buffer, buffer_u32, current_time);
    buffer_write(buffer, buffer_u16, global.ping);
    var bufferSize = buffer_tell(buffer);
    buffer_seek(buffer, buffer_seek_start, 0);
    buffer_write(buffer, buffer_s32, bufferSize);
    buffer_write(buffer, buffer_u8, 103);
    buffer_write(buffer, buffer_u32, current_time);
    buffer_write(buffer, buffer_u16, global.ping);
    var result = network_send_packet(socket, buffer, buffer_tell(buffer));
}

if (resetTimer == 0)
{
    buffer_delete(buffer);
    var size = 1024;
    var type = 1;
    var alignment = 1;
    buffer = buffer_create(size, type, alignment);
    buffer_seek(buffer, buffer_seek_start, 0);
    buffer_write(buffer, buffer_u8, 20);
    buffer_write(buffer, buffer_u8, global.clientID);
    var bufferSize = buffer_tell(buffer);
    buffer_seek(buffer, buffer_seek_start, 0);
    buffer_write(buffer, buffer_s32, bufferSize);
    buffer_write(buffer, buffer_u8, 20);
    buffer_write(buffer, buffer_u8, global.clientID);
    var result = network_send_packet(socket, buffer, buffer_tell(buffer));
}

if (currentItemsTimer == 0 && connected)
{
    currentItemsTimer = 120;
    buffer_delete(buffer);
    var size = 1024;
    var type = 1;
    var alignment = 1;
    buffer = buffer_create(size, type, alignment);
    buffer_seek(buffer, buffer_seek_start, 0);
    buffer_write(buffer, buffer_u8, 104);
    buffer_write(buffer, buffer_u8, global.clientID);
    buffer_write(buffer, buffer_u8, global.spacejump);
    buffer_write(buffer, buffer_u8, global.screwattack);
    buffer_write(buffer, buffer_u8, global.spiderball);
    buffer_write(buffer, buffer_u8, global.speedbooster);
    buffer_write(buffer, buffer_u8, global.bomb);
    buffer_write(buffer, buffer_u8, global.ibeam);
    buffer_write(buffer, buffer_u8, global.wbeam);
    buffer_write(buffer, buffer_u8, global.pbeam);
    buffer_write(buffer, buffer_u8, global.sbeam);
    buffer_write(buffer, buffer_u8, global.cbeam);
    buffer_write(buffer, buffer_u8, global.canScrewMulti);
    var bufferSize = buffer_tell(buffer);
    buffer_seek(buffer, buffer_seek_start, 0);
    buffer_write(buffer, buffer_s32, bufferSize);
    buffer_write(buffer, buffer_u8, 104);
    buffer_write(buffer, buffer_u8, global.clientID);
    buffer_write(buffer, buffer_u8, global.spacejump);
    buffer_write(buffer, buffer_u8, global.screwattack);
    buffer_write(buffer, buffer_u8, global.spiderball);
    buffer_write(buffer, buffer_u8, global.speedbooster);
    buffer_write(buffer, buffer_u8, global.bomb);
    buffer_write(buffer, buffer_u8, global.ibeam);
    buffer_write(buffer, buffer_u8, global.wbeam);
    buffer_write(buffer, buffer_u8, global.pbeam);
    buffer_write(buffer, buffer_u8, global.sbeam);
    buffer_write(buffer, buffer_u8, global.cbeam);
    buffer_write(buffer, buffer_u8, global.canScrewMulti);
    var result = network_send_packet(socket, buffer, buffer_tell(buffer));
}

if (beginReceiveTimer == 0 && connected)
{
    alarm[0] = 5;
    alarm[2] = 5;
    alarm[3] = 5;
    alarm[4] = 5;
    alarm[5] = 5;
    alarm[6] = 5;
    alarm[7] = 5;
    alarm[8] = 5;
    alarm[9] = 5;
    alarm[10] = 3;
    alarm[11] = 20;
}

time--;
maxpbombsTimer--;
maxhealthTimer--;
etanksTimer--;
mtanksTimer--;
stanksTimer--;
ptanksTimer--;
hpAmmoSyncTimer--;
missilesTimer--;
smissilesTimer--;
pbombsTimer--;
disconnectTimer--;
pingTimer--;
currentItemsTimer--;

if (global.receiving)
    beginReceiveTimer--;

if (resetTimer > -1)
    resetTimer--;

if (beginReceiveTimer < -1)
    beginReceiveTimer = -1;

if (instance_exists(id))
{
    if (ds_list_size(roomListData) > 0)
    {
        for (var h = 0; h < ds_list_size(roomListData); h++)
        {
            var arrList = ds_list_find_value(roomListData, h);
            var arrID = arrList[0];
            var arrX = arrList[1];
            var arrY = arrList[2];
            var arrName = arrList[15];
            var findHatchlingID = ds_list_find_index(global.hatchlingList, arrID);
            
            if (instance_exists(oHatchling))
            {
                if (findHatchlingID == -1)
                {
                    ds_list_add(global.hatchlingList, arrID);
                    var hatchling = instance_create(arrX, arrY, oHatchling);
                    
                    with (hatchling)
                    {
                        targetx = arrX;
                        targety = arrY;
                        myid = arrID;
                        name = arrName;
                    }
                }
            }
            else if (findHatchlingID >= 0)
            {
                ds_list_delete(global.hatchlingList, findHatchlingID);
            }
        }
    }
    else if (ds_list_size(global.hatchlingList) > 0)
    {
        ds_list_clear(global.hatchlingList);
    }
}

switch (syncedDifficulty)
{
    case 0:
        if (global.saxmode && !global.sax)
        {
            if (global.difficulty != syncedDifficulty)
                global.difficulty = syncedDifficulty;
            
            if (oControl.mod_fusion != 1)
                oControl.mod_fusion = 1;
            
            if (oControl.mod_diffmult != 1)
                oControl.mod_diffmult = 1;
        }
        else
        {
            if (global.difficulty != syncedDifficulty)
                global.difficulty = syncedDifficulty;
            
            if (oControl.mod_fusion != 0)
                oControl.mod_fusion = 0;
            
            if (oControl.mod_diffmult != 1)
                oControl.mod_diffmult = 1;
        }
        
        break;
    
    case 1:
        if (global.saxmode && !global.sax)
        {
            if (global.difficulty != syncedDifficulty)
                global.difficulty = syncedDifficulty;
            
            if (oControl.mod_fusion != 1)
                oControl.mod_fusion = 1;
            
            if (oControl.mod_diffmult != 1)
                oControl.mod_diffmult = 1;
        }
        else
        {
            if (global.difficulty != syncedDifficulty)
                global.difficulty = syncedDifficulty;
            
            if (oControl.mod_fusion != 0)
                oControl.mod_fusion = 0;
            
            if (oControl.mod_diffmult != 1)
                oControl.mod_diffmult = 1;
        }
        
        break;
    
    case 2:
        if (global.saxmode && !global.sax)
        {
            if (global.difficulty != syncedDifficulty)
                global.difficulty = syncedDifficulty;
            
            if (oControl.mod_fusion != 1)
                oControl.mod_fusion = 1;
            
            if (oControl.mod_diffmult != 2)
                oControl.mod_diffmult = 2;
        }
        else
        {
            if (global.difficulty != syncedDifficulty)
                global.difficulty = syncedDifficulty;
            
            if (oControl.mod_fusion != 0)
                oControl.mod_fusion = 0;
            
            if (oControl.mod_diffmult != 2)
                oControl.mod_diffmult = 2;
        }
        
        break;
    
    case 3:
        if (global.saxmode && !global.sax)
        {
            if (global.difficulty != 2)
                global.difficulty = 2;
            
            if (oControl.mod_fusion != 1)
                oControl.mod_fusion = 1;
            
            if (oControl.mod_diffmult != 4)
                oControl.mod_diffmult = 4;
        }
        else if (global.saxmode && global.sax)
        {
            if (global.difficulty != 2)
                global.difficulty = 2;
            
            if (oControl.mod_fusion != 0)
                oControl.mod_fusion = 0;
            
            if (oControl.mod_diffmult != 4)
                oControl.mod_diffmult = 4;
        }
        else
        {
            if (global.difficulty != 2)
                global.difficulty = 2;
            
            if (oControl.mod_fusion != 1)
                oControl.mod_fusion = 1;
            
            if (oControl.mod_diffmult != 4)
                oControl.mod_diffmult = 4;
        }
        
        break;
}

if (oControl.mod_monstersextremecheck != elm)
    oControl.mod_monstersextremecheck = elm;

if ((!global.ingame || !global.opshowhud) && global.saxmode)
{
    var lowestDist = 1000;
    var enemyCount = 0;
    
    for (var i = 0; i < ds_list_size(oClient.posData); i++)
    {
        var arrData = ds_list_find_value(oClient.posData, i);
        var ID = arrData[0];
        var xDiff = oClient.posX - arrData[1];
        var yDiff = oClient.posY - arrData[2];
        var sax = arrData[3];
        var spectator = arrData[5];
        var playerState = arrData[6];
        
        if (playerState == 1)
        {
            xDiff *= 2;
            yDiff *= 2;
        }
        
        var dist = max(abs(xDiff), abs(yDiff));
        
        if (sax != global.sax && ID != global.clientID)
        {
            if (spectator)
            {
                if (sax)
                    lowestDist = min(lowestDist, dist);
            }
            else
            {
                lowestDist = min(lowestDist, dist);
            }
        }
        
        if (sax != global.sax)
            enemyCount++;
    }
    
    if (ds_list_size(oClient.posData) == 0 || enemyCount == 0)
    {
        global.scannerSprite = 1883;
        global.enemyNearby = 0;
        global.inMusSAXRange = 0;
    }
    
    if (enemyCount > 0)
    {
        if (lowestDist > 5)
            global.inMusSAXRange = 0;
        
        if (lowestDist <= 5)
            global.inMusSAXRange = 1;
        
        if (lowestDist > 4)
        {
            global.enemyNearby = 0;
            global.scannerSprite = 1883;
        }
        
        if (lowestDist <= 4)
        {
            global.enemyNearby = 0;
            global.scannerSpeedMax = 7;
            global.scannerSprite = 1882;
        }
        
        if (lowestDist <= 3)
        {
            global.enemyNearby = 1;
            global.scannerSpeedMax = 4;
            global.scannerSprite = 1882;
        }
        
        if (lowestDist <= 2)
        {
            global.enemyNearby = 1;
            global.scannerSpeedMax = 4;
            global.scannerSprite = 1881;
        }
        
        if (lowestDist <= 1)
        {
            global.enemyNearby = 1;
            global.scannerSpeedMax = 3;
            global.scannerSprite = 1880;
        }
        
        if (lowestDist == 0)
        {
            global.enemyNearby = 1;
            global.scannerSpeedMax = 2;
            global.scannerSprite = 1880;
        }
    }
}

if (connected && room == rm_a1h01 && global.event[51] == 0 && global.log[21] > 0 && global.sax && global.saxmode)
{
    var playerInBossRoom = 0;
    
    if (ds_list_size(oClient.posData) > 0)
    {
        for (var i = 0; i < ds_list_size(oClient.posData); i++)
        {
            var arrMapIcon = ds_list_find_value(oClient.posData, i);
            var sax = arrMapIcon[3];
            var playerRoom = arrMapIcon[4];
            
            if (sax != global.sax && playerRoom == 55)
                playerInBossRoom = 1;
        }
    }
    
    if (playerInBossRoom)
    {
        global.targetx = 1200;
        global.targety = 160;
        room_change(35, 1);
    }
}
