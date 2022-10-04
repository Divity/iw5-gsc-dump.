// IW5 PC GSC
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    maps\mp\mp_roughneck_precache::main();
    maps\createart\mp_roughneck_art::main();
    maps\mp\mp_roughneck_fx::main();
    maps\mp\_explosive_barrels::main();
    maps\mp\_load::main();
    ambientplay( "ambient_mp_roughneck" );
    maps\mp\_compass::setupMiniMap( "compass_map_mp_roughneck" );
    setdvar( "r_lightGridEnableTweaks", 1 );
    setdvar( "r_lightGridIntensity", 1.33 );
    setdvar( "r_diffuseColorScale", 1.25 );
    setdvar( "r_specularColorScale", 2.75 );

    if ( level.ps3 )
        setdvar( "sm_sunShadowScale", "0.5" );
    else
        setdvar( "sm_sunShadowScale", "0.75" );

    game["attackers"] = "axis";
    game["defenders"] = "allies";
    audio_settings();
    var_0 = getent( "trigger_underwater", "targetname" );
    var_0 thread watchplayerenterwater();
    level thread clearwatervarsonspawn( var_0 );
}

audio_settings()
{
    maps\mp\_audio::add_reverb( "default", "quarry", 0.15, 0.9, 2 );
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
    playfx( level._effect["body_splash"], self.origin );

    if ( !maps\mp\_utility::isUsingRemote() )
        self shellshock( "default", 8 );
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
            var_1 stopshellshock();
        }
    }
}
