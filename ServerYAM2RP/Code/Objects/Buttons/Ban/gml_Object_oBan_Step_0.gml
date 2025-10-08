if (instance_exists(oServer))
{
    if (ds_list_size(oServer.idList) > 0)
    {
        if (!instance_exists(oBanButton))
        {
            for (var i = 0; i < ds_list_size(oServer.idList); i++)
            {
                if (!is_undefined(ds_list_find_value(oServer.idList, i)))
                {
                    var arr = ds_list_find_value(oServer.idList, i);
                    show_debug_message(string(arr));
                    
                    if (is_array(arr))
                        show_debug_message("is array");
                    
                    show_debug_message(string(arr[0, 0]));
                    var arrID = arr[0, 0];
                    var arrIP = arr[0, 3];
                    button = instance_create(150, global.basePlayerNameHeight + ((i + 1) * 30), oBanButton);
                    button.ID = arrID;
                    button.IP = arrIP;
                }
            }
        }
        else
        {
            for (var i = 0; i < ds_list_size(oServer.idList); i++)
            {
                if (!is_undefined(ds_list_find_value(oServer.idList, i)))
                {
                    var arr = ds_list_find_value(oServer.idList, i);
                    var arrID = arr[0, 0];
                    var arrIP = arr[0, 3];
                    var found = 0;
                    
                    with (oBanButton)
                    {
                        if (arrID == ID)
                            found = 1;
                    }
                    
                    if (!found)
                    {
                        button = instance_create(150, global.basePlayerNameHeight + ((i + 1) * 30), oBanButton);
                        button.ID = arrID;
                        button.IP = arrIP;
                    }
                }
            }
        }
    }
}
