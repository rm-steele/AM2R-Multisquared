with (oA1MovingPlatform2)
{
    alarm[0] = 60;

    if (instance_exists(myblock))
    {
        block2 = instance_create(768, 48, oSolid2x2);
        block2.material = 3;

        with (myblock)
            instance_destroy();
    }
}

global.event[58] = 1;
