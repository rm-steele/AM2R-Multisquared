if (room != rm_transition)
{
    sfx_stop(203);
    x = global.targetx + global.offsetx;
    y = global.targety + global.offsety;

    if (global.event[304] == 1)
    {
        if (!instance_exists(oHatchling) && !instance_exists(oHatchlingIntro))
            instance_create(x, y - 16, oHatchling);
    }

    if (oControl.mod_earlybaby == 1 && global.event[304] == 0 && !instance_exists(oHatchling) && room_get_name(room) != "rm_a7c01")
        instance_create(x, y - 16, oHatchling);

    spawn_random_septogg(1, max(1, floor(room_width / 500), floor(room_height / 500)), 18);
    alarm[11] = 1;
}

xGlow = 0;

if (string_count("rm_a", room_get_name(room)) && global.lastroom != rm_subscreen)
{
    if (instance_number(oGotoRoom) == 0 && global.dowarp == 1) // safeguard to not trap the player, though should no longer be needed
        room_change(rm_a0h02, 1);
    else if (global.dowarp = 1)
    {
        global.dowarp = 0;
        var target = noone;

        for (var i = 0; i < instance_number(oGotoRoom); i++)
        {
            target = instance_find(oGotoRoom, i);
            if (target.shortcut = 0)
                break;
        }

        x = target.x + (8 * (target.direction == 90 || target.direction == 270));
        y = target.y;
        if (state == LOCKEDBALL || state == WATERJET)
        {
            state = 23;
            statetime = 0;
            morphing = 0;
            turning = 0;
            canbehit = 1;
        }
        global.darkness = 0;
        global.waterlevel = 0;
        global.watertype = 0;

        if (isCollisionUnmorph() != 1)
        {
            if (state = KNOCKBACK1)
                canbehit = 1;

            state = BALL;
            morphing = 1;
            image_index = 0;
            statetime = 0;
            turning = 0;
            xVel = 0;
            dash = 0;
            nomorph = 10;
            sfx_play(15);
        }
    }
    else if (global.warpsleft > 0 && instance_exists(oMWConnector) && oMWConnector.alarm[0] < 1) // whether i make it random is still pending
    {
        global.warpsleft--;
        var rm_steele = random_room();
        with (oGotoRoom)
            targetroom = rm_steele;
        global.dowarp = 1;
    }
}
