draw_self();

if (instance_exists(oServer))
{
    var str = "";
    var findIDSamus = ds_list_find_index(oServer.samusList, ID);
    
    if (findIDSamus >= 0 && global.saxmode)
        str = "Fusion: ";
    
    if (findIDSamus >= 0 && !global.saxmode)
        str = "Good: ";
    
    var findIDSAX = ds_list_find_index(oServer.saxList, ID);
    
    if (findIDSAX >= 0 && global.saxmode)
        str = "SA-X: ";
    
    if (findIDSAX >= 0 && !global.saxmode)
        str = "Diabolical: ";
    
    draw_text(x + 70, y, str);
    var str2 = "";
    var currentRoom = ds_map_find_value(global.readyMap, ID);
    
    if (!is_undefined(currentRoom) && currentRoom != 0 && currentRoom != 1 && currentRoom != 4 && currentRoom != 5 && currentRoom != 6 && currentRoom != 13 && currentRoom != 14 && currentRoom != 15)
        str2 = "In-Game";
    else
        str2 = "In The Menus";
    
    draw_text(x + 160, y, str2);
}
