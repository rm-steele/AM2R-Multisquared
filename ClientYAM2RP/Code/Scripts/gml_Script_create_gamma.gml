met = instance_create(argument0, argument1, oMGamma);
met.facing = argument3;
met.myid = argument2;

with (met)
{
    set_monster_vars(argument2);
    shell = instance_create(x, y, oMAlphaShell);
    shell.sprite_index = sMGammaShell;
    shell.damage = damage;
    shell.hpush = 5;
    shell.vpush = -3;
    shell.gamma = 1;
    event_user(3);
}

if (global.monstersalive == 0)
{
    sfx_stop(136);
    sfx_play(136);
    mus_gamma_monster();
}

global.monstersalive += 1;
