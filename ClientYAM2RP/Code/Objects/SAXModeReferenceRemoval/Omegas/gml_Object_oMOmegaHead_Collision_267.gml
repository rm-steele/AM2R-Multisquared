if (other.x < x)
    var pushdir = -1;
else
    var pushdir = 1;

if (other.invincible == 0 && other.state != 40)
{
    oMOmega.damagedealt += oMOmega.damage;
    var damageToDeal = oMOmega.damage;
    
    damage_player(damageToDeal, oMOmega.hpush, oMOmega.vpush, 0, 0);
}
