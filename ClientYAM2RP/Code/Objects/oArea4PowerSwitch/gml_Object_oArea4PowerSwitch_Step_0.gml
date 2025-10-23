if (global.spectator)
    exit;

if (state == 1)
{
    if (statetime == 1)
        mus_fadeout(275);
    
    if (statetime < 20)
    {
        if (oCharacter.x > 320)
        {
            with (oCharacter)
                x -= 1;
        }
        
        if (oCharacter.x < 320)
        {
            with (oCharacter)
                x += 1;
        }
    }
    
    if (statetime > 5 && statetime < 25)
    {
        if (oCharacter.y < 184)
            oCharacter.y += 0.5;
    }
    
    if (statetime == 20)
        instance_create(320, 144, oA4SwitchCables);
    
    if (statetime == 25)
    {
        global.event[200] = 1;
        global.darkness = 0;
        
        with (oLightEngine)
            event_user(2);
        
        with (oDoor)
        {
            if (x == 616 && y == 80)
                lock = 0;
        }
        
        with (oA4PowerBG)
            event_user(0);
        
        mus_change(276);
    }
    
    if (statetime == 30)
    {
        with (oCharacter)
        {
            state = 23;
            statetime = 0;
            morphing = 0;
            turning = 0;
        }
        
        update_log(26);
        instance_destroy();
    }
    
    if (statetime > 25)
    {
        if (oCharacter.y > 176)
            oCharacter.y -= 0.5;
    }
    
    statetime += 1;
}
