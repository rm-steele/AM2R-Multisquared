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
            global.curropt -= 1;
        
        if (global.curropt < 0)
            global.curropt = lastitem;
        
        targety = op[global.curropt].y + lastitem;
        
        if (targety > vTargetY)
            targety = vTargetY;
        
        sfx_play(189);
        global.tiptext = tip[global.curropt];
    }
    
    if (oControl.kUp > 0 && oControl.kUpPushedSteps == 0 && oControl.kLeft == 0 && oControl.kRight == 0)
    {
        if (editing && global.curropt == num_seed)
        {
            var tempseed = op[num_seed].optext;
            var char = real(string_char_at(tempseed, op[num_seed].sel + 1));
            char++;
            
            if (floor(char) > 9)
                char = 0;
            
            tempseed = string_delete(tempseed, op[num_seed].sel + 1, 1);
            tempseed = string_insert(string(char), tempseed, op[num_seed].sel + 1);
            op[num_seed].optext = tempseed;
            seed = tempseed;
            oControl.mod_seed = real(tempseed);
            sfx_play(189);
        }
    }
    
    if (oControl.kDown > 0 && oControl.kDownPushedSteps == 0 && oControl.kLeft == 0 && oControl.kRight == 0)
    {
        if (editing && global.curropt == num_seed)
        {
            var tempseed = op[num_seed].optext;
            var char = real(string_char_at(tempseed, op[num_seed].sel + 1));
            char--;
            
            if (floor(char) < 0)
                char = 9;
            
            tempseed = string_delete(tempseed, op[num_seed].sel + 1, 1);
            tempseed = string_insert(string(char), tempseed, op[num_seed].sel + 1);
            op[num_seed].optext = tempseed;
            seed = tempseed;
            oControl.mod_seed = real(tempseed);
            sfx_play(189);
        }
    }
    
    if (oControl.kLeft > 0 && oControl.kLeftPushedSteps == 0 && oControl.kDown == 0 && oControl.kUp == 0)
    {
        if (editing && global.curropt == num_seed)
        {
            op[num_seed].sel--;
            
            if (floor(op[num_seed].sel) < 0)
                op[num_seed].sel = 9;

            sfx_play(189);
        }

        if (global.curropt == num_fusionOverride)
        {
            global.opfusionoverride--;
            global.opfusionoverride = ((global.opfusionoverride + 4) % 3) - 1;
        }

        event_user(2);

    }
    
    if (oControl.kRight > 0 && oControl.kRightPushedSteps == 0 && oControl.kDown == 0 && oControl.kUp == 0)
    {
        if (editing && global.curropt == num_seed)
        {
            op[num_seed].sel++;
            
            if (floor(op[num_seed].sel) > 9)
                op[num_seed].sel = 0;

        sfx_play(189);
        }

        if (global.curropt == num_fusionOverride)
        {
            global.opfusionoverride++;
            global.opfusionoverride = ((global.opfusionoverride + 1) % 3) - 1;
        }

        event_user(2);
    }
    
    if (((oControl.kLeft > 0 && oControl.kLeftPushedSteps == 0) || (oControl.kRight > 0 && oControl.kRightPushedSteps == 0)) && global.curropt < lastitem && oControl.kDown == 0 && oControl.kUp == 0 && global.curropt != num_seed)
    {
        if (global.curropt == num_useSeed)
            oControl.mod_usemanualseed = !oControl.mod_usemanualseed;
        
        if (global.curropt == num_insanity)
            oControl.mod_insanitymode = !oControl.mod_insanitymode;
        
        if (global.curropt == num_elm)
            oControl.mod_monstersextremecheck = !oControl.mod_monstersextremecheck;
        
        sfx_play(189);
        event_user(2);
    }
    
    if (oControl.kMenu1 && oControl.kMenu1PushedSteps == 0)
    {
        if (global.curropt == num_seed)
        {
            editing = !editing;
            op[num_seed].editing = editing;
            sfx_play(188);
        }
        
        if (global.curropt == lastitem)
        {
            save_gameoptions();
            save_modifiers();
            global.curropt = 3;
            room_change(1, 0);
            sfx_play(188);
        }
    }
}

if (targety != y)
    y += ((targety - y) / 10);

timer -= 1;

if (timer < 0)
    timer = 8;
