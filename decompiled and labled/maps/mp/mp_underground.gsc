// IW5 PC GSC
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    maps\mp\mp_underground_precache::main();
    maps\createart\mp_underground_art::main();
    maps\mp\mp_underground_fx::main();
    maps\mp\_load::main();
    ambientplay( "ambient_mp_underground" );
    maps\mp\_compass::setupMiniMap( "compass_map_mp_underground" );
    setdvar( "r_lightGridEnableTweaks", 1 );
    setdvar( "r_lightGridIntensity", 1.33 );
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    audio_settings();
    thread _ID18668();
}

audio_settings()
{
    maps\mp\_audio::add_reverb( "default", "arena", 0.15, 0.9, 2 );
}

_ID18668()
{
    var_0 = 1200;
    var_1 = 3;
    var_2 = 0;

    for (;;)
    {
        var_2 = var_2 % var_1 + 1;
        var_3 = getentarray( "ac130_overhead_" + var_2, "targetname" );
        var_4 = 0;
        var_5 = [];

        foreach ( var_7 in var_3 )
        {
            var_8 = spawn( "script_model", var_7.origin );
            var_8.angles = var_7.angles;
            var_8 setmodel( var_7.model );
            var_9 = getent( var_7.target, "targetname" );
            var_10 = distance( var_9.origin, var_7.origin );
            var_11 = var_0;

            if ( isdefined( var_7.speed ) )
                var_11 = var_7.speed;

            var_12 = var_10 / var_11;

            if ( var_12 > var_4 )
                var_4 = var_12;

            var_8 moveto( var_9.origin, var_12 );
            var_8 thread _ID18669( var_12 );
            var_5[var_5.size] = var_8;
        }

        wait(var_4);

        foreach ( var_8 in var_5 )
        {
            var_8 notify( "delete_plane" );
            wait 0.05;
            var_8 delete();
        }

        wait(randomfloatrange( 5, 20 ));
    }
}

_ID18669( var_0 )
{
    self endon( "delete_plane" );
}
