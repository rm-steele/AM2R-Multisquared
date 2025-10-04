with (oCharacter)
{
    state = STANDING;
    facing = LEFT;
}

scr_disableplayercontrol();

with (oMonsterEgg)
{
    image_speed = 0.25;
    if(global.dnatanks < global.dnacount)
        alarm[1] = 120;
    else
        alarm[0] = 120;
}
if(global.dnatanks >= global.dnacount)
    instance_create(0, 0, hatchling_freeze);

sfx_play(145);
instance_destroy();
