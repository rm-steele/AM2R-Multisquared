repeat (20)
    instance_create(argument0 + random(argument2), argument1 + random(argument3), oHPickupBig);

if (global.maxmissiles > 0)
{
    repeat (20)
        instance_create(argument0 + random(argument2), argument1 + random(argument3), oMPickup);
}

if (global.maxsmissiles > 0)
{
    repeat (5)
        instance_create(argument0 + random(argument2), argument1 + random(argument3), oSMPickup);
}

if ((global.inventory[0] == 0 && global.maxpbombs > 0) || (oControl.mod_insanitymode == 1 && global.maxpbombs > 0))
{
    repeat (5)
        instance_create(argument0 + random(argument2), argument1 + random(argument3), oPBPickup);
}
