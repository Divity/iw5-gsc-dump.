// IW5 PC GSC
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    maps\mp\mp_courtyard_ss_precache::main();
    maps\createart\mp_courtyard_ss_art::main();
    maps\mp\mp_courtyard_ss_fx::main();
    maps\mp\_load::main();
    ambientplay( "ambient_mp_aqueduct" );
    maps\mp\_compass::setupMiniMap( "compass_map_mp_courtyard_ss" );
    setdvar( "r_lightGridEnableTweaks", 1 );
    setdvar( "r_lightGridIntensity", 1.33 );
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    maps\mp\gametypes\faceoff::main( undefined, undefined, ::ctfallyspawnadjustments, ::sabaxisspawnadjustments, ::saballyspawnadjustments );
    audio_settings();
}

audio_settings()
{
    maps\mp\_audio::add_reverb( "default", "quarry", 0.15, 0.9, 2 );
}

ctfallyspawnadjustments()
{
    maps\mp\gametypes\faceoff::createscriptspawnpoint( ( -882, -294, 54 ), ( 0, 315, 0 ), "additional_spawn_allies" );
}

sabaxisspawnadjustments()
{
    maps\mp\gametypes\faceoff::createscriptspawnpoint( ( 106.5, -291, 136 ), ( 0, 360, 0 ), "additional_spawn_axis" );
}

saballyspawnadjustments()
{
    maps\mp\gametypes\faceoff::createscriptspawnpoint( ( 828, -1702, 148 ), ( 0, 90, 0 ), "additional_spawn_allies" );
}
