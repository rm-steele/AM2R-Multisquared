if (instance_exists(oMWConnector))
    exit;

// previously the mwconnector would cause crashes from connecting while connected
// to multitroid, but this has since been rectified.
/*
if (instance_exists(oClient))
{
    popup_text_ext("Disconnect from Multitroid first", 180);
    exit;
}
 */
instance_create(x, y, oMWConnector);
