// IW5 PC GSC
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    maps\mp\mp_exchange_precache::main();
    maps\createart\mp_exchange_art::main();
    maps\mp\mp_exchange_fx::main();
    maps\mp\_load::main();
    ambientplay( "ambient_mp_exchange" );
    maps\mp\_compass::setupMiniMap( "compass_map_mp_exchange" );
    game["attackers"] = "axis";
    game["defenders"] = "allies";
    audio_settings();
}

audio_settings()
{
    maps\mp\_audio::add_reverb( "default", "city", 0.2, 0.9, 2 );
}
