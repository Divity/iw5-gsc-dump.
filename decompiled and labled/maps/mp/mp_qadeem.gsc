// IW5 PC GSC
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    maps\mp\mp_qadeem_precache::main();
    maps\createart\mp_qadeem_art::main();
    maps\mp\mp_qadeem_fx::main();
    maps\mp\_load::main();
    ambientplay( "ambient_mp_qadeem" );
    maps\mp\_compass::setupMiniMap( "compass_map_mp_qadeem" );
    setdvar( "r_lightGridEnableTweaks", 1 );
    setdvar( "r_lightGridIntensity", 1.33 );
    setdvar( "r_diffuseColorScale", 1.32 );
    setdvar( "r_specularColorScale", 3.25 );
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    thread spawn_blocker_collision( ( 1464, 2004, 428 ), ( 0, 0, 0 ) );
    thread spawn_blocker_collision( ( 1464, 2004, 458 ), ( 0, 0, 0 ) );
    thread spawn_blocker_collision( ( 1464, 2004, 488 ), ( 0, 0, 0 ) );
    thread spawn_blocker_collision( ( 1464, 2037, 428 ), ( 0, 0, 0 ) );
    thread spawn_blocker_collision( ( 1464, 2037, 458 ), ( 0, 0, 0 ) );
    thread spawn_blocker_collision( ( 1464, 2037, 488 ), ( 0, 0, 0 ) );
    thread spawn_blocker_collision( ( 1464, 2070, 428 ), ( 0, 0, 0 ) );
    thread spawn_blocker_collision( ( 1464, 2070, 458 ), ( 0, 0, 0 ) );
    thread spawn_blocker_collision( ( 1464, 2070, 488 ), ( 0, 0, 0 ) );
    thread spawn_blocker_collision( ( 1464, 2103, 428 ), ( 0, 0, 0 ) );
    thread spawn_blocker_collision( ( 1464, 2103, 458 ), ( 0, 0, 0 ) );
    thread spawn_blocker_collision( ( 1464, 2103, 488 ), ( 0, 0, 0 ) );
    audio_settings();
    var_0 = getent( "trigger_underwater", "targetname" );
    var_0 thread watchplayerenterwater();
    level thread clearwatervarsonspawn( var_0 );
    level thread waitcarryobjects();
}

audio_settings()
{
    maps\mp\_audio::add_reverb( "default", "city", 0.2, 0.9, 2 );
}

clearwatervarsonspawn( var_0 )
{
    level endon( "game_ended" );

    for (;;)
    {
        level waittill( "player_spawned",  var_1  );

        if ( !var_1 istouching( var_0 ) )
        {
            var_1._ID7818 = undefined;
            var_1.underwater = undefined;
            var_1 notify( "out_of_water" );
        }
    }
}

watchplayerenterwater()
{
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "trigger",  var_0  );

        if ( !isplayer( var_0 ) )
        {
            if ( isdefined( var_0.heliType ) && var_0.heliType == "remote_uav" )
            {
                wait 0.5;
                var_0 notify( "death" );
            }

            if ( isdefined( var_0.tankType ) && var_0.tankType == "remote_tank" )
            {
                wait 0.5;
                var_0 notify( "death" );
            }

            continue;
        }
        else
            playfxontag( level._effect["water_bubbles_random_runner_qad"], var_0, "tag_origin" );

        if ( !isalive( var_0 ) )
            continue;

        if ( !isdefined( var_0._ID7818 ) )
        {
            var_0._ID7818 = 1;
            var_0 thread playerunderwater( self );
        }
    }
}

playerunderwater( var_0 )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self.selectingLocation = 1;
    self notify( "force_cancel_placement" );
    playfx( level._effect["body_splash"], self.origin );

    if ( !maps\mp\_utility::isUsingRemote() )
        self shellshock( "default", 8 );

    var_1 = self.origin;
    var_2 = self.angles;
    thread underwater_damage();
    common_scripts\utility::waittill_any( "death", "disconnect" );
    self.selectingLocation = undefined;
    self notify( "force_cancel_placement" );

    if ( isdefined( self.setSpawnpoint ) && self.setSpawnpoint istouching( var_0 ) )
        maps\mp\perks\_perkfunctions::deleteTI( self.setSpawnpoint );
}

underwater_damage()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );

    for (;;)
    {
        radiusdamage( self.origin + anglestoforward( self.angles ) * 5, 16, 34, 34, undefined, "MOD_TRIGGER_HURT" );
        wait 1;
    }
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
    if ( !isdefined( level.nodroptriggers ) )
        getnodrops();

    for (;;)
    {
        self waittill( "dropped" );
        wait 0.1;

        foreach ( var_1 in level.nodroptriggers )
        {
            if ( self.visuals[0] istouching( var_1 ) )
            {
                if ( level.gameType == "ctf" )
                    maps\mp\gametypes\_gameobjects::returnHome();
                else
                {
                    var_2 = common_scripts\utility::getstruct( var_1.target, "targetname" );
                    thread movecarryobject( var_2.origin, var_2.angles );
                }

                break;
            }
        }
    }
}

getnodrops()
{
    level.nodroptriggers = [];
    var_0 = getentarray( "no_drop", "targetname" );

    foreach ( var_2 in var_0 )
    {
        if ( var_2.classname == "trigger_multiple" )
            level.nodroptriggers = common_scripts\utility::add_to_array( level.nodroptriggers, var_2 );
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

spawn_blocker_collision( var_0, var_1 )
{
    while ( !isdefined( level.airDropCrateCollision ) )
        wait 0.05;

    var_2 = spawn( "script_model", ( 0, 0, 0 ) );
    var_2 setmodel( "tag_origin" );
    var_2.origin = var_0;
    var_2.angles = var_1;
    var_2 clonebrushmodeltoscriptmodel( level.airDropCrateCollision );
}
