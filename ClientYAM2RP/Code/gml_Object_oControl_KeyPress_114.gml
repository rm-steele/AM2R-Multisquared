if (instance_exists(oMWConnector))
    exit;
/*
 * if the connector receives a multitroid packet it will crash.
 * it'd probably be possible to detect if it's a multitroid packet and deny it,
 * but i would need to know how a gms packet is structured vs a "raw" am2r client
 * packet
 */
if (instance_exists(oClient))
{
    popup_text_ext("Disconnect from Multitroid first", 180);
    exit;
}

instance_create(x, y, oMWConnector);
