var damage = 10;
damage = global.mod_omegadamagegroundhit;
var pushdir;

if (oCharacter.x > x)
    pushdir = 1;
else
    pushdir = -1;

if (oCharacter.state == 10 || oCharacter.state == 11 || oCharacter.state == 12 || oCharacter.state == 23)
{
    var damageToDeal = damage;
    
    damage_player_knockdown(damageToDeal, pushdir, 10, 0, 1);
}

instance_destroy();
