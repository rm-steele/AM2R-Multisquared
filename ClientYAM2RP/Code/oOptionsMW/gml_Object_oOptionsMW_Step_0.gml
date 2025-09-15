if (active)
{
    if (oControl.kDown > 0 && (oControl.kDownPushedSteps == 0 || (oControl.kDownPushedSteps > 30 && timer == 0)) && !editing)
    {
        global.curropt += 1;
        
        if (global.curropt > lastitem)
            global.curropt = 0;
        
        sfx_play(189);
        global.tiptext = tip[global.curropt];
    }
    
    if (oControl.kUp > 0 && (oControl.kUpPushedSteps == 0 || (oControl.kUpPushedSteps > 30 && timer == 0)) && !editing)
    {
        global.curropt -= 1;
        
        if (global.curropt < 0)
            global.curropt = lastitem;
        
        sfx_play(189);
        global.tiptext = tip[global.curropt];
    }
    
    if (oControl.kMenu1 && oControl.kMenu1PushedSteps == 0 && !editing)
    {
        if (global.curropt == 0)
        {
            sfx_play(188);
            keyboard_string = global.slotName;
            editing = 1;
            editingoption = 0;
        }
        
        if (global.curropt == 1)
        {
            sfx_play(188);
            editing = 1;
            editingoption = 1;
            keyboard_string = global.slotPass;
        }
        
        if (global.curropt == 2)
        {
            sfx_play(188);

            // previously the mwconnector would cause crashes from connecting while connected
            // to multitroid, but this has since been rectified.
            /*
            if (instance_exists(oClient))
            {
                popup_text_ext("Disconnect from Multitroid first", 180);
                exit;
            }
            */

            if (!instance_exists(oMWConnector))
                instance_create(0, 0, oMWConnector);
        }
        
        if (global.curropt == 3)
        {
            instance_create(50, 92, oOptionsMain);
            instance_destroy();
            sfx_play(188);
        }
    }
    
    if (editing)
    {
        if (global.curropt == 0)
        {
            global.slotName = keyboard_string;
            op[editingoption + 1].optext = global.slotName;
        }
        
        if (global.curropt == 1)
        {
            global.slotPass = keyboard_string;
            op[editingoption + 1].optext = global.slotPass;
        }
        
        if (keyboard_check_pressed(vk_enter))
            editing = 0;
    }
}

timer -= 1;

if (timer < 0)
    timer = 8;
