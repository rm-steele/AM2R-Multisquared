if (!global.Page)
    exit;

image_index = !global.allowclientteamchanges;
draw_self();
draw_set_halign(fa_right);
draw_text(x - sprite_width, y - 12, "Allow clients to change their team");
draw_set_halign(fa_left);
