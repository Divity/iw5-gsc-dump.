// IW5 PC GSC
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    maps\mp\mp_aground_ss_precache::main();
    maps\createart\mp_aground_ss_art::main();
    maps\mp\mp_aground_ss_fx::main();
    maps\mp\_load::main();
    ambientplay( "ambient_mp_aground" );
    maps\mp\_compass::setupMiniMap( "compass_map_mp_aground_ss" );
    setdvar( "r_lightGridEnableTweaks", 1 );
    setdvar( "r_lightGridIntensity", 1.33 );
    setdvar( "r_diffuseColorScale", 1.055 );
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    audio_settings();
    maps\mp\gametypes\faceoff::main( ::tdmspawnadjustments, ::ctfaxisspawnadjustments, ::ctfallyspawnadjustments, ::sabaxisspawnadjustments, undefined );
    level thread waitcarryobjects();
}

audio_settings()
{
    maps\mp\_audio::add_reverb( "default", "city", 0.15, 0.9, 2 );
}

tdmspawnadjustments()
{
    maps\mp\gametypes\faceoff::createscriptspawnpoint( ( 354.3, 1595.5, 472 ), ( 0, 205, 0 ), "additional_spawn" );
    maps\mp\gametypes\faceoff::createscriptspawnpoint( ( 770.3, 1603.5, 504 ), ( 0, 295, 0 ), "additional_spawn" );
    maps\mp\gametypes\faceoff::createscriptspawnpoint( ( 661.5, -1166.8, 176 ), ( 0, 70, 0 ), "additional_spawn" );
    maps\mp\gametypes\faceoff::createscriptspawnpoint( ( -493.7, -876.5, 384 ), ( 0, 100, 0 ), "additional_spawn" );
    maps\mp\gametypes\faceoff::createscriptspawnpoint( ( 282.3, 75.5, 72 ), ( 0, 175, 0 ), "additional_spawn" );
}

ctfaxisspawnadjustments()
{
    maps\mp\gametypes\faceoff::createscriptspawnpoint( ( 334.9, 1590, 472 ), ( 0, 225, 0 ), "additional_spawn_axis" );
    maps\mp\gametypes\faceoff::createscriptspawnpoint( ( 1094.9, 154, 28 ), ( 0, 175, 0 ), "additional_spawn_axis" );
    maps\mp\gametypes\faceoff::createscriptspawnpoint( ( 319.5, 667.2, 276 ), ( 0, 344, 0 ), "additional_spawn_axis" );
}

ctfallyspawnadjustments()
{
    maps\mp\gametypes\faceoff::createscriptspawnpoint( ( 681.1, -1148, 172 ), ( 0, 60, 0 ), "additional_spawn_allies" );
    maps\mp\gametypes\faceoff::createscriptspawnpoint( ( -482.9, -876, 388 ), ( 0, 105, 0 ), "additional_spawn_allies" );
    maps\mp\gametypes\faceoff::createscriptspawnpoint( ( -490.9, -1216, 388 ), ( 0, 35, 0 ), "additional_spawn_allies" );
    maps\mp\gametypes\faceoff::createscriptspawnpoint( ( -242.9, -16, 160 ), ( 0, 110, 0 ), "additional_spawn_allies" );
}

sabaxisspawnadjustments()
{
    maps\mp\gametypes\faceoff::createscriptspawnpoint( ( 319.5, 667.2, 276 ), ( 0, 344, 0 ), "additional_spawn_axis" );
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
    level endon( "game_ended" );
    var_0 = -110;

    for (;;)
    {
        self waittill( "dropped" );
        wait 0.25;

        if ( self.trigger.origin[2] < var_0 )
            maps\mp\gametypes\_gameobjects::returnHome();
    }
}
