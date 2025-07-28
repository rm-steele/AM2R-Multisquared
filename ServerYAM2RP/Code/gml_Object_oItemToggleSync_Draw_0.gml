if (!global.Page)
    exit;

draw_self();
draw_set_halign(fa_left);
draw_text(x + 30, y - 12, "Toggle whether enabling/disabling items is shared");
