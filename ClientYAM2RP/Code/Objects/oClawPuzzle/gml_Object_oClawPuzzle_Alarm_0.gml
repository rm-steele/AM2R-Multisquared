with (oClawOrb)
    event_user(0);

with (oA1MovingPlatform)
{
    alarm[0] = 60;
    if (instance_exists(myblock))
    {
        block2 = instance_create(608, 112, oSolid2x2);
        block2.material = 3;

        with (myblock)
            instance_destroy();
    }

}

global.event[54] = 1;
event_user(0);
