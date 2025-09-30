/*
 * Part of this code is modified from AM2R Chaos Edition's script of the same name
 * Thanks to M8-TEN and Bastion B-56 for their code and explanations of how it worked there
 */

var result = irandom_range(21, 393);

if (global.event[55] < 1 && (result == 55 || result == 63 || result == 64)) // don't get put above guardian if it isn't defeated
    return random_room();
if (global.event[203] >= 9 && (result == 217 || (result >= 220 && result <= 235))) // don't get put in undestroyed geo when it's destroyed
    return random_room();
if (global.event[203] < 9 && (result == 218 || result == 219)) // don't get put in destroyed geo when it's not destroyed
    return random_room();
if (global.event[176] < 1 && (result == 170 || (result >= 374 && result <= 390))) // don't get put in thoth when it's not open
    return random_room();

if (result == 129 ||
    result == 236 ||
    result == 237 ||
    result == 243 ||
    result == 244 ||
    result == 245 ||
    result == 351 ||
    result == 357 ||
    result == 358 ||
    result == 380 ||
    result == 381 ||
    result == 385 ||
    result == 391 ||
    result == 392) // don't get placed in unused rooms
    return random_room();

return result;