if (global.inventory[10])
{
    draw_sprite(sSubScrButton, global.cbeam, x - 28, y - 46);
    draw_text(x - 20, (y - 47) + oControl.subScrItemOffset, cbeam);
}

if (global.inventory[12])
{
    draw_sprite(sSubScrButton, global.wbeam, x - 28, y - 37);
    draw_text(x - 20, (y - 38) + oControl.subScrItemOffset, wbeam);
}

if (global.inventory[13])
{
    draw_sprite(sSubScrButton, global.sbeam, x - 28, y - 28);
    draw_text(x - 20, (y - 29) + oControl.subScrItemOffset, sbeam);
}

if (global.inventory[14])
{
    draw_sprite(sSubScrButton, global.pbeam, x - 28, y - 19);
    draw_text(x - 20, (y - 20) + oControl.subScrItemOffset, pbeam);
}

if (global.inventory[11])
{
    draw_sprite(sSubScrButton, global.ibeam, x - 28, y - 10);
    draw_text(x - 20, (y - 11) + oControl.subScrItemOffset, ibeam);
}
