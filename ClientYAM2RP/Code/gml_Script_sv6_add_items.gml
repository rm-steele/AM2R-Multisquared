var list = ds_list_create();
i = 0;

repeat (350)
{
    ds_list_add(list, global.item[i]);
    i += 1;
}

i = 400;

repeat (400)
{
    i -= 1;
    ds_list_add(list, global.multiItem[i]);
}

i = 0;

repeat (15)
{
    ds_list_add(list, global.inventory[i]);
    i += 1;
}

var str_list = ds_list_write(list);
ds_list_clear(list);
return str_list;
