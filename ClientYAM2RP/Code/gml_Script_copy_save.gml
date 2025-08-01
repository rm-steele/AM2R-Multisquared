file1 = global.savedirectory + string(argument0 + 1);
file2 = global.savedirectory + string(argument1 + 1);

if (file_exists(file2))
    file_delete(file2);

file_copy(file1, file2);

with (oGameSelMenu)
    event_user(2);

saveslot_flash(argument1);

if (file_exists("random" + string(argument1 + 1) + ".ini"))
    file_delete("random" + string(argument1 + 1) + ".ini");

if (file_exists("save" + string(argument1 + 1) + ".dat"))
    file_delete("save" + string(argument1 + 1) + ".dat");

if (file_exists("save" + string(argument0 + 1) + ".dat"))
    file_copy("save" + string(argument0 + 1) + ".dat", "save" + string(argument1 + 1) + ".dat");
