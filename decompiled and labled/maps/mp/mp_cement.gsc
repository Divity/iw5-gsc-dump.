// IW5 PC GSC
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    if ( !isdefined( level.func ) )
        level.func = [];

    level.func["precacheMpAnim"] = ::precachempanim;
    level.func["scriptModelPlayAnim"] = ::scriptmodelplayanim;
    level.func["scriptModelClearAnim"] = ::scriptmodelclearanim;
    common_scripts\_interactive::init();
    maps\mp\mp_cement_precache::main();
    maps\createart\mp_cement_art::main();
    maps\mp\mp_cement_fx::main();
    maps\mp\_load::main();
    ambientplay( "ambient_mp_cement" );
    maps\mp\_compass::setupMiniMap( "compass_map_mp_cement" );
    setdvar( "r_lightGridEnableTweaks", 1 );
    setdvar( "r_lightGridIntensity", 1.33 );

    if ( level.ps3 )
        setdvar( "sm_sunShadowScale", "0.5" );
    else
        setdvar( "sm_sunShadowScale", "0.8" );

    game["attackers"] = "allies";
    game["defenders"] = "axis";
}
