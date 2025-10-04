if (instance_exists(oServer))
{
    if (ds_list_size(oServer.idList) > 0)
    {
        var match = 0;
        
        for (var i = 0; i < ds_list_size(oServer.idList); i++)
        {
            if (!is_undefined(ds_list_find_value(oServer.idList, i)))
            {
                var arr = ds_list_find_value(oServer.idList, i);
                var arrID = arr[0, 0];
                
                if (arrID == ID)
                    match = 1;
            }
        }
        
        if (!match)
            instance_destroy();
    }
    else
    {
        instance_destroy();
    }
    
    for (var i = 0; i < ds_list_size(oServer.idList); i++)
    {
        if (!is_undefined(ds_list_find_value(oServer.idList, i)))
        {
            var arr = ds_list_find_value(oServer.idList, i);
            var arrID = arr[0, 0];
            
            if (arrID == ID)
                y = 87 + ((i + 1) * 30);
        }
    }
}
else
{
    instance_destroy();
}
