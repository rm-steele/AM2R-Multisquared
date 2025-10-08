if (active)
{
    if (oControl.kDown > 0 && (oControl.kDownPushedSteps == 0 || (oControl.kDownPushedSteps > 30 && timer == 0)) && !editing)
    {
        global.curropt += 1;
        
        if (global.curropt > lastitem)
            global.curropt = 0;
        
        while (canedit[global.curropt] == 0)
            global.curropt += 1;
        
        if (global.curropt > lastitem)
            global.curropt = 0;
        
        targety = op[global.curropt].y + lastitem;
        
        if (targety > vTargetY)
            targety = vTargetY;
        
        sfx_play(189);
        global.tiptext = tip[global.curropt];
    }
    
    if (oControl.kUp > 0 && (oControl.kUpPushedSteps == 0 || (oControl.kUpPushedSteps > 30 && timer == 0)) && !editing)
    {
        global.curropt -= 1;
        
        if (global.curropt < 0)
            global.curropt = lastitem;
        
        while (canedit[global.curropt] == 0)
        {
            global.curropt -= 1;
            
            if (global.curropt < 0)
                global.curropt = lastitem;
        }
        
        targety = op[global.curropt].y + lastitem;
        
        if (targety > vTargetY)
            targety = vTargetY;
        
        sfx_play(189);
        global.tiptext = tip[global.curropt];
    }
    
    if (oControl.kLeft > 0 && oControl.kLeftPushedSteps == 0 && oControl.kDown == 0 && oControl.kUp == 0)
    {
        if (global.shaders_compiled)
        {
            if (global.curropt == num_color)
            {
                oControl.preferredcolor--;
                
                if (oControl.preferredcolor < 1)
                    oControl.preferredcolor = 17;
                
                sfx_play(189);
                event_user(2);
            }
            
            if (global.curropt == num_palette)
            {
                oControl.palette--;
                
                if (oControl.palette < 0)
                    oControl.palette = 3;
                
                sfx_play(189);
                event_user(2);
            }
        }
    }
    
    if (oControl.kRight > 0 && oControl.kRightPushedSteps == 0 && oControl.kDown == 0 && oControl.kUp == 0)
    {
        if (global.shaders_compiled)
        {
            if (global.curropt == num_color)
            {
                oControl.preferredcolor++;
                
                if (oControl.preferredcolor > 17)
                    oControl.preferredcolor = 1;
                
                sfx_play(189);
                event_user(2);
            }
            
            if (global.curropt == num_palette)
            {
                oControl.palette++;
                
                if (oControl.palette > 3)
                    oControl.palette = 0;
                
                sfx_play(189);
                event_user(2);
            }
        }
    }
    
    if ((oControl.kLeft > 0 && oControl.kLeftPushedSteps == 0) || (oControl.kRight > 0 && oControl.kRightPushedSteps == 0 && global.curropt < lastitem && oControl.kDown == 0 && oControl.kUp == 0))
    {
        if (global.curropt == num_censorip)
            oControl.censorip = !oControl.censorip;
        
        if (global.curropt == num_showname)
            showname = !showname;
        
        if (global.curropt == num_selfpalette)
            oControl.useselfpalette = !oControl.useselfpalette;

        if (global.curropt == num_team && canedit[num_team])
        {
            if (instance_exists(oClient))
            {
                with (oClient)
                {
                    buffer_delete(buffer);
                    buffer = buffer_create(1024, 1, 1);
                    buffer_seek(buffer, buffer_seek_start, 0);
                    buffer_write(buffer, buffer_s32, 1);
                    buffer_write(buffer, buffer_u8, 37);
                    buffer_poke(buffer, 0, buffer_s32, buffer_tell(buffer) - 4);
                    network_send_packet(socket, buffer, buffer_tell(buffer));
                }
            }
        }
        sfx_play(189);
        event_user(2);
    }
    
    var keyBegin = oControl.kMenu1 > 0;
    var key;
    
    if (os_type != os_android)
        key = keyboard_check_pressed(vk_enter);
    else
        key = oControl.kMenu1 > 0;
    
    if ((key && oControl.kMenu1PushedSteps == 0) || (os_type != os_android && keyBegin && oControl.kMenu1PushedSteps == 0 && !editing))
    {
        if (global.curropt == num_ip && os_type != os_android)
        {
            editing = !editing;
            op[num_ip].editing = editing;
            
            if (editing)
                keyboard_string = ip;
            
            sfx_play(188);
            event_user(2);
        }
        else if (global.curropt == num_ip && os_type == os_android)
        {
            if (!editing)
                msg = get_string_async("Type in the IP Address to connect to.", ip);
            
            editing = !editing;
            op[num_ip].editing = editing;
        }
        
        if (global.curropt == num_port && os_type != os_android)
        {
            editing = !editing;
            op[num_port].editing = editing;
            
            if (editing)
                keyboard_string = port;
            
            sfx_play(188);
            event_user(2);
        }
        else if (global.curropt == num_port && os_type == os_android)
        {
            if (!editing)
                msg = get_integer_async("Type in the server port.", real(port));
            
            editing = !editing;
            op[num_port].editing = editing;
        }
        
        if (global.curropt == num_name && os_type != os_android)
        {
            editing = !editing;
            op[num_name].editing = editing;
            
            if (editing)
                keyboard_string = name;
            
            sfx_play(188);
            event_user(2);
        }
        else if (global.curropt == num_name && os_type == os_android)
        {
            if (!editing)
                msg = get_string_async("Type in your nametag.", name);
            
            editing = !editing;
            op[num_name].editing = editing;
        }
    }
    
    if (oControl.kMenu1 && oControl.kMenu1PushedSteps == 0)
    {
        if (global.curropt == num_connection)
        {
            if (!instance_exists(oClient) && global.canConnect && !global.TryConnect)
            {
                global.TryConnect = 1;
                alarm[2] = 1;
            }
            else
            {
                with (oClient)
                    instance_destroy();
                
                connectiontxt = "Connect";
                op[num_connection].label = connectiontxt;
            }
            
            sfx_play(188);
            event_user(2);
        }
        
        if (global.curropt == lastitem)
        {
            save_gameoptions();
            view_object[0] = -4;
            view_yview[0] = 0;
            instance_create(50, 92, oOptionsMain);
            instance_destroy();
            sfx_play(188);
            exit;
        }
    }
    
    if (editing && global.curropt == num_ip && os_type != os_android)
    {
        ip = keyboard_string;
        op[num_ip].optext = ip;
    }
    
    if (editing && global.curropt == num_port && os_type != os_android)
    {
        port = keyboard_string;
        op[num_port].optext = port;
    }
    
    if (editing && global.curropt == num_name && os_type != os_android)
    {
        var keyboardLength = string_length(keyboard_string);
        
        if (keyboardLength > 15)
            keyboard_string = string_copy(keyboard_string, 1, 15);
        
        name = keyboard_string;
        op[num_name].optext = name;
    }
}

if (targety != y)
    y += ((targety - y) / 10);

timer -= 1;

if (timer < 0)
    timer = 8;

if (instance_exists(oClient))
{
    if (instance_exists(connID))
    {
        connectiontxt = "Disconnect";
        op[num_connection].label = connectiontxt;
    }
    if (global.freeForAll)
    {
        canedit[num_team] = 0;
        op[num_team].enabled = 0;
    }
    else
    {
        canedit[num_team] = 1;
        op[num_team].enabled = 1;
    }
}
else
{
    if (instance_exists(connID))
    {
        connectiontxt = "Connect";
        op[num_connection].label = connectiontxt;
    }
    canedit[num_team] = 0;
    op[num_team].enabled = 0;
}

if (!done)
{
    if (oControl.censorip && !op[num_ip].editing)
    {
        op[num_ip].optext = "";
        init = 1;
    }
    
    if (op[num_ip].editing)
    {
        if (keyboard_check(vk_control) && keyboard_check_pressed(ord("V")))
            keyboard_string = clipboard_get_text();
    }

    if (global.freeForAll)
        op[num_team].optext = "FFA";
    else
    {
        switch (global.sax)
        {
            case 0:
                op[num_team].optext = "Good";
                break;
            case 1:
                op[num_team].optext = "Diabolical";
                break;
        }
    }
}
