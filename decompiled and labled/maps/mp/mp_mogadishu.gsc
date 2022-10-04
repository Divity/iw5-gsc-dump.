// IW5 PC GSC
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    maps\mp\mp_mogadishu_precache::main();
    maps\createart\mp_mogadishu_art::main();
    maps\mp\mp_mogadishu_fx::main();
    maps\mp\_load::main();
    ambientplay( "ambient_mp_mogadishu" );
    maps\mp\_compass::setupMiniMap( "compass_map_mp_mogadishu" );
    game["attackers"] = "allies";
    game["defenders"] = "axis";

    if ( level.gameType == "oic" || level.gameType == "gun" || level.gameType == "infect" )
    {
        var_0 = getent( "misc_turret", "classname" );
        var_0 delete();
    }
}
