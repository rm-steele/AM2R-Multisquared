if (!global.Page)
    exit;

image_index = !global.freeForAll;
draw_self();
draw_set_halign(fa_right);
draw_text(x - sprite_width, y - 12, "Toggle free-for-all combat");
draw_set_halign(fa_left);
