// IW5 PC GSC
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    maps\mp\mp_burn_ss_precache::main();
    maps\createart\mp_burn_ss_art::main();
    maps\mp\mp_burn_ss_fx::main();
    maps\mp\_load::main();
    ambientplay( "ambient_mp_burn" );
    maps\mp\_compass::setupMiniMap( "compass_map_mp_burn_ss" );
    setdvar( "r_lightGridEnableTweaks", 1 );
    setdvar( "r_lightGridIntensity", 1.33 );
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    maps\mp\gametypes\faceoff::main( ::tdmspawnadjustments, ::ctfaxisspawnadjustments, undefined, ::sabaxisspawnadjustments, ::saballyspawnadjustments );
    audio_settings();
}

audio_settings()
{
    maps\mp\_audio::add_reverb( "default", "quarry", 0.15, 0.9, 2 );
}

tdmspawnadjustments()
{
    maps\mp\gametypes\faceoff::createscriptspawnpoint( ( -788, -454.5, -48 ), ( 0, 270, 0 ), "additional_spawn" );
    maps\mp\gametypes\faceoff::createscriptspawnpoint( ( -788, 382.5, -41 ), ( 0, 90, 0 ), "additional_spawn" );
    maps\mp\gametypes\faceoff::createscriptspawnpoint( ( -1984, -848, 28 ), ( 0, 0, 0 ), "additional_spawn" );
}

ctfaxisspawnadjustments()
{
    maps\mp\gametypes\faceoff::createscriptspawnpoint( ( 491, -362, 84 ), ( 0, 193, 0 ), "additional_spawn_axis" );
}

sabaxisspawnadjustments()
{
    maps\mp\gametypes\faceoff::createscriptspawnpoint( ( 300, 896, 24 ), ( 0, 277, 0 ), "additional_spawn_axis" );
}

saballyspawnadjustments()
{
    maps\mp\gametypes\faceoff::createscriptspawnpoint( ( -1516, -868, 0 ), ( 0, 30, 0 ), "additional_spawn_allies" );
}
