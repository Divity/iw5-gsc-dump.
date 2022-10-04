// IW5 PC GSC
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    maps\mp\mp_carbon_precache::main();
    maps\createart\mp_carbon_art::main();
    maps\mp\mp_carbon_fx::main();
    maps\mp\_explosive_barrels::main();
    maps\mp\_load::main();
    ambientplay( "ambient_mp_carbon" );
    maps\mp\_compass::setupMiniMap( "compass_map_mp_carbon" );
    setdvar( "r_lightGridEnableTweaks", 1 );
    setdvar( "r_lightGridIntensity", 1.33 );

    if ( level.ps3 )
        setdvar( "sm_sunShadowScale", "0.5" );
    else
        setdvar( "sm_sunShadowScale", "0.8" );

    game["attackers"] = "allies";
    game["defenders"] = "axis";
    audio_settings();
    precachemodel( "com_teddy_bear" );
    level thread _ID18755();
}

audio_settings()
{
    maps\mp\_audio::add_reverb( "default", "mountains", 0.2, 0.9, 2 );
}

_ID18755()
{
    level endon( "game_ended" );
    var_0 = common_scripts\utility::getstruct( "teddy_1", "targetname" );

    for (;;)
    {
        wait 180;
        var_1 = spawn( "script_model", var_0.origin );
        var_1 setmodel( "com_teddy_bear" );
        var_1.angles = ( 0, 0, 0 ) + ( randomint( 360 ), randomint( 360 ), randomint( 360 ) );
        var_1 show();
        var_1 physicslaunchserver();
        var_1 thread _ID18756();
    }
}

_ID18756()
{
    self waittill( "physics_finished" );
    level thread _ID18757( self );

    if ( abs( self.origin[2] - level.lowSpawn.origin[2] ) > 3000 )
        self delete();
}

_ID18757( var_0 )
{
    level endon( "game_ended" );
    var_0 endon( "death" );
    maps\mp\gametypes\_hostmigration::waitLongDurationWithHostMigrationPause( 30 );
    var_0 delete();
}
