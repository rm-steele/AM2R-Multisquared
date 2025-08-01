if (!global.Page)
    exit;

draw_self();
draw_set_halign(fa_right);
draw_text(x - sprite_width, y - 12, "Toggle location check sharing");
draw_set_halign(fa_left);
