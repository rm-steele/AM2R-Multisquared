if (prevPlayerListSize != ds_list_size(playerList) && ds_list_size(playerList) > 0)
{
    prevPlayerListSize = ds_list_size(playerList);
    var sockets = ds_list_size(playerList);
    buffer_delete(buffer);
    var size = 1024;
    var type = 1;
    var alignment = 1;
    buffer = buffer_create(size, type, alignment);
    buffer_seek(buffer, buffer_seek_start, 0);
    buffer_write(buffer, buffer_u8, 102);
    buffer_write(buffer, buffer_string, strict_compress(ds_list_write(idList)));
    var bufferSize = buffer_tell(buffer);
    buffer_seek(buffer, buffer_seek_start, 0);
    buffer_write(buffer, buffer_s32, bufferSize);
    buffer_write(buffer, buffer_u8, 102);
    buffer_write(buffer, buffer_string, strict_compress(ds_list_write(idList)));
    
    for (var i = 0; i < sockets; i++)
        network_send_packet(ds_list_find_value(playerList, i), buffer, buffer_tell(buffer));
}

if (ds_list_size(playerList) > 0 && ds_list_size(timeList) > 0)
{
    if (ds_list_size(playerList) == ds_list_size(timeList) || ds_list_size(timeList) > ds_list_size(playerList))
    {
        ds_list_sort(timeList, 0);
        var time = ds_list_find_value(timeList, 0);
        var sockets = ds_list_size(playerList);
        buffer_delete(buffer);
        var size = 1024;
        var type = 1;
        var alignment = 1;
        buffer = buffer_create(size, type, alignment);
        buffer_seek(buffer, buffer_seek_start, 0);
        buffer_write(buffer, buffer_u8, 20);
        buffer_write(buffer, buffer_s32, time);
        var bufferSize = buffer_tell(buffer);
        buffer_seek(buffer, buffer_seek_start, 0);
        buffer_write(buffer, buffer_s32, bufferSize);
        buffer_write(buffer, buffer_u8, 20);
        buffer_write(buffer, buffer_s32, time);
        
        for (var i = 0; i < sockets; i++)
            network_send_packet(ds_list_find_value(playerList, i), buffer, buffer_tell(buffer));
        
        ds_list_clear(timeList);
    }
}

for (var a = 0; a < ds_list_size(samusList); a++)
{
    var match = 0;
    
    for (var b = 0; b < ds_list_size(idList); b++)
    {
        var arrList = ds_list_find_value(idList, b);
        
        if (ds_list_find_value(samusList, a) == arrList[0, 0])
            match = 1;
    }
    
    if (!match)
        ds_list_delete(samusList, a);
}

for (var a = 0; a < ds_list_size(saxList); a++)
{
    var match = 0;
    
    for (var b = 0; b < ds_list_size(idList); b++)
    {
        var arrList = ds_list_find_value(idList, b);
        
        if (ds_list_find_value(saxList, a) == arrList[0, 0])
            match = 1;
    }
    
    if (!match)
        ds_list_delete(saxList, a);
}

for (var a = 0; a < ds_list_size(deadList); a++)
{
    var match = 0;
    
    for (var b = 0; b < ds_list_size(idList); b++)
    {
        var arrList = ds_list_find_value(idList, b);
        
        if (ds_list_find_value(deadList, a) == arrList[0, 0])
            match = 1;
    }
    
    if (!match)
        ds_list_delete(deadList, a);
}

if (ds_list_size(playerList) > 0 && ds_list_size(resetList) > 0)
{
    if (ds_list_size(playerList) == ds_list_size(resetList) || ds_list_size(resetList) > ds_list_size(playerList))
    {
        event_user(0);
        ds_list_clear(resetList);
    }
}

var dt = delta_time / 1000000;

if (!global.lobbyLocked)
    ds_list_clear(deadList);

if (ds_list_size(playerList) > 0)
{
    // tally everyone's items to get an average
    var players = 0;
    var totalItems = 0;
    for(var i = 0; i < 256; i++)
    {
        if(clientItemCounts[i] > -1)
        {
            players++;
            totalItems += clientItemCounts[i];
        }
    }
    if(players == 0)
        global.damageMult = 0
    else
        global.damageMult = 4 * ((totalItems / players) / 88); // get the average item percentage of players, then multiply it by 4 to scale it between 0 and 4 (the normal damage mult in sa-x before doomsday)
}
