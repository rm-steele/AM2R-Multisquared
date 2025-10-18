var multiItem, corestr;

multiItem = GetMultiItem(argument0);
if (multiItem > 19 && multiItem < 40)
    multiItem -= 20;
if (multiItem > 19 && multiItem < 100)
{
    multiItem = irandom(20);
    if (multiItem == 1)
        multiItem = 100;
    if (multiItem == 20)
        multiItem = 101;
}
switch (multiItem)
{
    case 0:
        corestr = "sCoreXBomb";
        break;
    
    case 2:
        corestr = "sCoreXSBall";
        break;
    
    case 3:
        corestr = "sCoreXJBall";
        break;
    
    case 4:
        corestr = "sCoreXHJBoots";
        break;
    
    case 5:
        corestr = "sCoreXVSuit";
        break;
    
    case 6:
        corestr = "sCoreXSJump";
        break;
    
    case 7:
        corestr = "sCoreXSBooster";
        break;
    
    case 8:
        corestr = "sCoreXSAttack";
        break;

    case 9:
        corestr = "sCoreXGSuit";
        break;
    
    case 10:
        corestr = "sCoreXCBeam";
        break;
    
    case 11:
        corestr = "sCoreXIBeam";
        break;
    
    case 12:
        corestr = "sCoreXWBeam";
        break;
    
    case 13:
        corestr = "sCoreXSBeam";
        break;
    
    case 14:
        corestr = "sCoreXPBeam";
        break;
    
    case 15:
        corestr = "sCoreXMissile";
        break;
    
    case 16:
        corestr = "sCoreXSMissile";
        break;
    
    case 17:
        corestr = "sCoreXEnergy";
        break;
    
    case 18:
        corestr = "sCoreXPBomb";
        break;
    
    case 19:
        corestr = "sCoreXDNA";
        break;

    case 100:
        corestr = "sCoreXMW";
        break;

    case 101:
        corestr = "sCoreXMWGlass";
        break;
        
    default:
        corestr = "sCoreXMWGlass";
        break;
}

var sensstr;

if (global.opcorexsensitivity)
    sensstr = "Sens";
else
    sensstr = "";

return asset_get_index(corestr + sensstr);
