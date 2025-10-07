if (special == 0)
{
    var expl = instance_create(x, y, oPBombExpl);
    expl.myid = 0;
    expl = instance_create(x, y, oPBombExpl);
    expl.image_angle = 90;
    expl.myid = 0;
    expl = instance_create(x, y, oPBombExpl);
    expl.image_angle = 180;
    expl.myid = 0;
    expl = instance_create(x, y, oPBombExpl);
    expl.image_angle = 270;
    expl.myid = 0;
    sfx_play(129);
}
else
{
    instance_create(x, y, oQueenFinalExplosion);
}

instance_destroy();
