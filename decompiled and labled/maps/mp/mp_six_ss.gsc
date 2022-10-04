// IW5 PC GSC
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    maps\mp\mp_six_ss_precache::main();
    maps\createart\mp_six_ss_art::main();
    maps\mp\mp_six_ss_fx::main();
    maps\mp\_load::main();
    ambientplay( "ambient_mp_six" );
    maps\mp\_compass::setupMiniMap( "compass_map_mp_six_ss" );
    setdvar( "r_lightGridEnableTweaks", 1 );
    setdvar( "r_lightGridIntensity", 1.33 );

    if ( level.xenon )
        setdvar( "sm_sunshadowScale", 0.8 );
    else if ( level.ps3 )
        setdvar( "sm_sunshadowScale", 0.5 );

    game["attackers"] = "allies";
    game["defenders"] = "axis";
    maps\mp\gametypes\faceoff::main( ::tdmspawnadjustments, ::ctfaxisspawnadjustments, undefined, undefined, ::saballyspawnadjustments );
    thread spawn_blocker_collision( ( 834.018, 1050.98, 182 ), ( 0, 274, 0 ) );
    thread spawn_blocker_collision( ( 834.018, 1050.98, 212 ), ( 0, 274, 0 ) );
    thread spawn_blocker_collision( ( 834.018, 1050.98, 242 ), ( 0, 274, 0 ) );
    thread spawn_blocker_collision( ( 838.018, 993.983, 182 ), ( 0, 274, 0 ) );
    thread spawn_blocker_collision( ( 838.018, 993.983, 212 ), ( 0, 274, 0 ) );
    thread spawn_blocker_collision( ( 838.018, 993.983, 242 ), ( 0, 274, 0 ) );
    thread spawn_blocker_collision( ( 842, 936.5, 182 ), ( 0, 274, 0 ) );
    thread spawn_blocker_collision( ( 842, 936.5, 212 ), ( 0, 274, 0 ) );
    thread spawn_blocker_collision( ( 842, 936.5, 242 ), ( 0, 274, 0 ) );
    thread spawn_blocker_collision( ( 846, 879.5, 182 ), ( 0, 274, 0 ) );
    thread spawn_blocker_collision( ( 846, 879.5, 212 ), ( 0, 274, 0 ) );
    thread spawn_blocker_collision( ( 846, 879.5, 242 ), ( 0, 274, 0 ) );
    thread spawn_blocker_collision( ( 850, 822.5, 182 ), ( 0, 274, 0 ) );
    thread spawn_blocker_collision( ( 850, 822.5, 212 ), ( 0, 274, 0 ) );
    thread spawn_blocker_collision( ( 850, 822.5, 242 ), ( 0, 274, 0 ) );
    thread spawn_blocker_collision( ( 854, 765.5, 182 ), ( 0, 274, 0 ) );
    thread spawn_blocker_collision( ( 854, 765.5, 212 ), ( 0, 274, 0 ) );
    thread spawn_blocker_collision( ( 854, 765.5, 242 ), ( 0, 274, 0 ) );
    thread spawn_blocker_collision( ( 858, 708.5, 182 ), ( 0, 274, 0 ) );
    thread spawn_blocker_collision( ( 858, 708.5, 212 ), ( 0, 274, 0 ) );
    thread spawn_blocker_collision( ( 858, 708.5, 242 ), ( 0, 274, 0 ) );
    thread spawn_blocker_collision( ( 862.5, 651.5, 182 ), ( 0, 274, 0 ) );
    thread spawn_blocker_collision( ( 862.5, 651.5, 212 ), ( 0, 274, 0 ) );
    thread spawn_blocker_collision( ( 862.5, 651.5, 242 ), ( 0, 274, 0 ) );
    thread spawn_blocker_collision( ( 866.5, 594.5, 182 ), ( 0, 274, 0 ) );
    thread spawn_blocker_collision( ( 866.5, 594.5, 212 ), ( 0, 274, 0 ) );
    thread spawn_blocker_collision( ( 866.5, 594.5, 242 ), ( 0, 274, 0 ) );
    thread spawn_blocker_collision( ( 870.5, 537.5, 182 ), ( 0, 274, 0 ) );
    thread spawn_blocker_collision( ( 870.5, 537.5, 212 ), ( 0, 274, 0 ) );
    thread spawn_blocker_collision( ( 870.5, 537.5, 242 ), ( 0, 274, 0 ) );
    thread spawn_blocker_collision( ( 874.5, 480.5, 182 ), ( 0, 274, 0 ) );
    thread spawn_blocker_collision( ( 874.5, 480.5, 212 ), ( 0, 274, 0 ) );
    thread spawn_blocker_collision( ( 874.5, 480.5, 242 ), ( 0, 274, 0 ) );
    thread spawn_blocker_collision( ( 878.5, 423.5, 182 ), ( 0, 274, 0 ) );
    thread spawn_blocker_collision( ( 878.5, 423.5, 212 ), ( 0, 274, 0 ) );
    thread spawn_blocker_collision( ( 878.5, 423.5, 242 ), ( 0, 274, 0 ) );
    thread spawn_blocker_collision( ( 881.5, 381.5, 212 ), ( 0, 274, 0 ) );
    thread spawn_blocker_collision( ( 881.5, 381.5, 242 ), ( 0, 274, 0 ) );
    thread spawn_blocker_collision( ( 842, 341.5, 212 ), ( 0, 179.4, 0 ) );
    thread spawn_blocker_collision( ( 842, 341.5, 242 ), ( 0, 179.4, 0 ) );
    thread spawn_blocker_collision( ( 785.5, 342, 182 ), ( 0, 179.4, 0 ) );
    thread spawn_blocker_collision( ( 785.5, 342, 212 ), ( 0, 179.4, 0 ) );
    thread spawn_blocker_collision( ( 785.5, 342, 242 ), ( 0, 179.4, 0 ) );
    thread spawn_blocker_collision( ( 742, 355, 182 ), ( 0, 89.8, 0 ) );
    thread spawn_blocker_collision( ( 742, 355, 212 ), ( 0, 89.8, 0 ) );
    thread spawn_blocker_collision( ( 742, 355, 242 ), ( 0, 89.8, 0 ) );
    audio_settings();
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

audio_settings()
{
    maps\mp\_audio::add_reverb( "default", "mountains", 0.25, 0.9, 2 );
}

tdmspawnadjustments()
{
    maps\mp\gametypes\faceoff::createscriptspawnpoint( ( 1338, -654, 224 ), ( 0, 180, 0 ), "additional_spawn" );
    maps\mp\gametypes\faceoff::createscriptspawnpoint( ( -592.5, 118, 88 ), ( 0, 270, 0 ), "additional_spawn" );
    maps\mp\gametypes\faceoff::createscriptspawnpoint( ( -816.5, -830, 212 ), ( 0, 90, 0 ), "additional_spawn" );
    maps\mp\gametypes\faceoff::createscriptspawnpoint( ( 488.5, 122, 108 ), ( 0, 90, 0 ), "additional_spawn" );
}

ctfaxisspawnadjustments()
{
    maps\mp\gametypes\faceoff::createscriptspawnpoint( ( -901, 1384, 146 ), ( 0, 200, 0 ), "additional_spawn_axis" );
    maps\mp\gametypes\faceoff::createscriptspawnpoint( ( 1333, 501.5, 246 ), ( 0, 270, 0 ), "additional_spawn_axis" );
}

saballyspawnadjustments()
{
    maps\mp\gametypes\faceoff::createscriptspawnpoint( ( -819.5, -332, 173 ), ( 0, 0, 0 ), "additional_spawn_allies" );
}
