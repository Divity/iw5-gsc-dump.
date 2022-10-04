// IW5 PC GSC
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    maps\mp\mp_italy_precache::main();
    maps\createart\mp_italy_art::main();
    maps\mp\mp_italy_fx::main();
    maps\mp\_load::main();
    ambientplay( "ambient_mp_italy" );
    maps\mp\_compass::setupMiniMap( "compass_map_mp_italy" );
    setdvar( "r_lightGridEnableTweaks", 1 );
    setdvar( "r_lightGridIntensity", 1.33 );
    game["attackers"] = "allies";
    game["defenders"] = "axis";
}
