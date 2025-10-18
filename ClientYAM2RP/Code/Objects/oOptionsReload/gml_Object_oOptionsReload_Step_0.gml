if (active)
{
    if (oControl.kDown && oControl.kDownPushedSteps == 0)
    {
        global.curropt += 1;
        
        if (global.curropt > lastitem)
            global.curropt = 0;
        
        sfx_play(189);
    }
    
    if (oControl.kUp && oControl.kUpPushedSteps == 0)
    {
        global.curropt -= 1;
        
        if (global.curropt < 0)
            global.curropt = lastitem;
        
        sfx_play(189);
    }
    
    if (oControl.kMenu1 && oControl.kMenu1PushedSteps == 0)
    {
        if (global.curropt == 0)
        {
            with (oControl)
            {
                quitgame = 1;
                reloadgame = 1;
            }
            
            sfx_stop_all();
            mus_stop_all();
            mus_current_update_volume();
            
            with (oSS_Fg)
                event_user(0);
            
            active = 0;
            global.clearWrongWarps = 1;
        }
        
        if (global.curropt == 1)
        {
            instance_create(50, 92, oPauseMenuOptions);
            global.warptoship = 0;
            instance_destroy();
        }
        
        sfx_play(188);
    }
}
