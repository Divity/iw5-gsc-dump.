// IW5 PC GSC
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    maps\mp\mp_meteora_precache::main();
    maps\createart\mp_meteora_art::main();
    maps\mp\mp_meteora_fx::main();
    maps\mp\_load::main();
    ambientplay( "ambient_mp_meteoradlc" );
    maps\mp\_compass::setupMiniMap( "compass_map_mp_meteora" );
    setdvar( "r_lightGridEnableTweaks", 1 );
    setdvar( "r_lightGridIntensity", 1.33 );
    game["attackers"] = "allies";
    game["defenders"] = "axis";

    if ( level.gameType == "grnd" )
        thread movedropzone();
    else
        thread waitcarryobjects();
}

movedropzone()
{
    level endon( "game_ended" );

    for (;;)
    {
        if ( isdefined( level.grnd_dropZones ) && isdefined( level.grnd_dropZones["mp_meteora"] ) && level.grnd_dropZones["mp_meteora"].size )
            break;

        wait 0.05;
    }

    for ( var_0 = 0; var_0 < level.grnd_dropZones["mp_meteora"].size; var_0++ )
    {
        if ( level.grnd_dropZones["mp_meteora"][var_0] == ( 1591.2, 1583.3, 1740 ) )
        {
            level.grnd_dropZones["mp_meteora"][var_0] = ( -1003.93, -873.069, 1592.93 );
            break;
        }
    }

    level.grnd_dropZones["mp_meteora"][level.grnd_dropZones["mp_meteora"].size] = ( -449.789, 1658.05, 1611.67 );
}

waitcarryobjects()
{
    level endon( "game_ended" );

    if ( level.gameType == "sd" )
    {
        while ( !isdefined( level.sdBomb ) )
            wait 0.05;

        level.sdBomb thread watchcarryobjects();
    }
    else if ( level.gameType == "sab" )
    {
        while ( !isdefined( level.sabBomb ) )
            wait 0.05;

        level.sabBomb thread watchcarryobjects();
    }
    else if ( level.gameType == "tdef" )
    {
        while ( !isdefined( level.gameFlag ) )
            wait 0.05;

        level.gameFlag thread watchcarryobjects();
    }
    else if ( level.gameType == "ctf" )
    {
        while ( !isdefined( level.teamFlags ) || !isdefined( level.teamFlags[game["defenders"]] ) || !isdefined( level.teamFlags[game["attackers"]] ) )
            wait 0.05;

        level.teamFlags[game["defenders"]] thread watchcarryobjects();
        level.teamFlags[game["attackers"]] thread watchcarryobjects();
    }
}

watchcarryobjects()
{
    if ( !isdefined( level.nodrops ) )
        createnodrops();

    for (;;)
    {
        self waittill( "dropped" );
        wait 0.1;

        foreach ( var_1 in level.nodrops )
        {
            if ( distance2d( self.curOrigin, var_1.pos ) < var_1.radius && self.curOrigin[2] > var_1.pos[2] && self.curOrigin[2] < var_1.pos[2] + var_1.height )
            {
                if ( level.gameType == "ctf" )
                    maps\mp\gametypes\_gameobjects::returnHome();
                else
                    thread movecarryobject( var_1.safepos, var_1.safeangle );

                break;
            }
        }
    }
}

movecarryobject( var_0, var_1 )
{
    self notify( "stop_pickup_timeout" );
    self notify( "picked_up" );
    self.isResetting = 1;

    for ( var_2 = 0; var_2 < self.visuals.size; var_2++ )
    {
        self.visuals[var_2].origin = var_0;
        self.visuals[var_2].angles = var_1;
        self.visuals[var_2] show();
    }

    self.trigger.origin = var_0;
    self.curOrigin = self.trigger.origin;
    maps\mp\gametypes\_gameobjects::clearCarrier();
    maps\mp\gametypes\_gameobjects::updateWorldIcons();
    maps\mp\gametypes\_gameobjects::updateCompassIcons();
    self.isResetting = 0;
}

createnodrops()
{
    level.nodrops = [];
    level.nodrops[0] = spawnstruct();
    level.nodrops[0].pos = ( 551, -184, 1381 );
    level.nodrops[0].radius = 150;
    level.nodrops[0].height = 130;
    level.nodrops[0].safepos = ( 705.125, -314.924, 1599.82 );
    level.nodrops[0].safeangle = ( 0, -30.5861, 0 );
    level.nodrops[1] = spawnstruct();
    level.nodrops[1].pos = ( -653, -718, 1416 );
    level.nodrops[1].radius = 180;
    level.nodrops[1].height = 100;
    level.nodrops[1].safepos = ( -834.061, -522.471, 1600.21 );
    level.nodrops[1].safeangle = ( 0, 155.764, 0 );
    level.nodrops[2] = spawnstruct();
    level.nodrops[2].pos = ( 120, 1576, 1448 );
    level.nodrops[2].radius = 200;
    level.nodrops[2].height = 100;
    level.nodrops[2].safepos = ( 210.198, 1686.45, 1601.13 );
    level.nodrops[2].safeangle = ( 0, 62.0453, 0 );
    level.nodrops[3] = spawnstruct();
    level.nodrops[3].pos = ( -318, 2547, 1440 );
    level.nodrops[3].radius = 200;
    level.nodrops[3].height = 100;
    level.nodrops[3].safepos = ( -449.421, 2778.5, 1561.22 );
    level.nodrops[3].safeangle = ( 0, 139.462, 0 );
    level.nodrops[4] = spawnstruct();
    level.nodrops[4].pos = ( -574, -1576, 1032 );
    level.nodrops[4].radius = 200;
    level.nodrops[4].height = 200;
    level.nodrops[4].safepos = ( -738.896, -1343.13, 1519.59 );
    level.nodrops[4].safeangle = ( 0, -125.039, 0 );
}
