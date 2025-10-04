with (oCharacter)
{
    damage_player_knockdown(0, 1, 0, 0, 45); // 45 is tossforce, it's 30 per toss trap so i'm starting here for now
    onfire = 60;
}
var expl = instance_create(x, y, oExplosionSmoke);
expl.width = 64;
expl.height = 112;
expl.expl_dir = 180;
expl.expl_spd = 2;
expl.explosions = 10;
expl.smoke_steps = 60;
expl.density = 5;

repeat (50)
{
    var deb = instance_create(x, y + random_range(-64, 64), oDebris);
    deb.alarm[0] = 60 + random(20);
    deb.direction = random_range(150, 210);
    deb.speed = 1 + random(6);
}

sfx_play(303);
screen_shake(30, 6);
instance_create(x, y, oScreenFlash);
global.enablecontrol = 1;

with (oGotoRoom)
    targetroom = random_room();
global.dowarp = 1;