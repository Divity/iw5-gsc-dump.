// IW5 PC GSC
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    maps\mp\mp_boardwalk_precache::main();
    maps\createart\mp_boardwalk_art::main();
    maps\mp\mp_boardwalk_fx::main();
    maps\mp\_load::main();
    ambientplay( "ambient_mp_boardwalk" );
    maps\mp\_compass::setupMiniMap( "compass_map_mp_boardwalk" );
    setdvar( "r_lightGridEnableTweaks", 1 );
    setdvar( "r_lightGridIntensity", 1.33 );
    setdvar( "r_diffuseColorScale", 1.2 );
    setdvar( "r_specularColorScale", 2.5 );
    thread maps\mp\mp_boardwalk_scriptlights::main();

    if ( level.ps3 )
        setdvar( "sm_sunShadowScale", "0.6" );
    else
        setdvar( "sm_sunShadowScale", "0.8" );

    game["attackers"] = "allies";
    game["defenders"] = "axis";
    audio_settings();
    level thread rotate_sign();
    level thread balloons();
    level thread carnival_games();
    level thread setup_carnival_items();
}

setup_carnival_items()
{
    level.carnival_fx_tag_01 = common_scripts\utility::spawn_tag_origin();
    level.carnival_fx_tag_02 = common_scripts\utility::spawn_tag_origin();
    level.carnival_fx_tag_03 = common_scripts\utility::spawn_tag_origin();
    level.carnival_fx_tag_04 = common_scripts\utility::spawn_tag_origin();
    level.carnival_fx_tag_05 = common_scripts\utility::spawn_tag_origin();
    level.carnival_fx_tag_06 = common_scripts\utility::spawn_tag_origin();
    level.carnival_fx_tag_07 = common_scripts\utility::spawn_tag_origin();
    level.carnival_fx_tag_08 = common_scripts\utility::spawn_tag_origin();
    level.carnival_fx_tag_01 moveto( ( -169.714, 1972.79, 184.634 ), 0.05 );
    level.carnival_fx_tag_02 moveto( ( -170.491, 2044.83, 184.671 ), 0.05 );
    level.carnival_fx_tag_03 moveto( ( -170.427, 2108.7, 184.655 ), 0.05 );
    level.carnival_fx_tag_04 moveto( ( -170.185, 2176.83, 184.662 ), 0.05 );
    level.carnival_fx_tag_05 moveto( ( -170.055, 2240.88, 184.664 ), 0.05 );
    level.carnival_fx_tag_06 moveto( ( 132.078, 1536.49, 193 ), 0.05 );
    level.carnival_fx_tag_07 moveto( ( 63.9661, 1536.99, 192.946 ), 0.05 );
    level.carnival_fx_tag_08 moveto( ( 1.6665, 1530.19, 189.955 ), 0.05 );
    level.carnival_fx_tag_01.angles = ( 270, 0, 0 );
    level.carnival_fx_tag_02.angles = ( 270, 0, 0 );
    level.carnival_fx_tag_03.angles = ( 270, 0, 0 );
    level.carnival_fx_tag_04.angles = ( 270, 0, 0 );
    level.carnival_fx_tag_05.angles = ( 270, 0, 0 );
    level.carnival_fx_tag_06.angles = ( 270, 0, 0 );
    level.carnival_fx_tag_07.angles = ( 270, 0, 0 );
    level.carnival_fx_tag_08.angles = ( 270, 0, 0 );
    level.carnival_fx_tag_01 show();
    level.carnival_fx_tag_02 show();
    level.carnival_fx_tag_03 show();
    level.carnival_fx_tag_04 show();
    level.carnival_fx_tag_05 show();
    level.carnival_fx_tag_06 show();
    level.carnival_fx_tag_07 show();
    level.carnival_fx_tag_08 show();
    level.carnivalgamefx = "mp_bw_clown01";
}

audio_settings()
{
    maps\mp\_audio::add_reverb( "default", "mountains", 0.25, 0.9, 2 );
}

rotate_sign()
{
    level endon( "game_ended" );
    var_0 = getent( "bbq_sign", "targetname" );

    if ( !isdefined( var_0 ) )
        return;

    var_1 = 8;

    for (;;)
    {
        var_0 rotateyaw( 360, var_1, 0, 0 );
        wait(var_1 - 0.1);
    }
}

balloons()
{
    level endon( "game_ended" );

    if ( !isdefined( level.remote_uav ) )
        level.remote_uav = [];

    var_0 = getentarray( "balloon_volume", "targetname" );

    while ( isdefined( var_0 ) && var_0.size > 0 )
    {
        foreach ( var_2 in level.remote_uav )
        {
            foreach ( var_4 in var_0 )
            {
                if ( !isdefined( var_2 ) )
                    break;

                if ( !isdefined( var_4 ) )
                    continue;

                if ( var_2 istouching( var_4 ) )
                {
                    radiusdamage( var_4.origin, 16, 2, 2, var_2 );
                    break;
                }

                common_scripts\utility::waitframe();
            }
        }

        wait 0.15;
    }
}

carnival_games()
{
    level thread roller_coaster();
    level thread animal_race();
    level thread baseball_pitch();
}

roller_coaster()
{
    var_0 = getent( "roller_coaster", "targetname" );
    var_1 = getentarray( "animated_model", "targetname" );

    if ( !isdefined( var_0 ) )
        return;

    foreach ( var_3 in var_1 )
    {
        if ( var_3.model == "generic_prop_raven" )
        {
            var_0 linkto( var_3, "J_prop_1", ( 0, 0, 0 ), ( 180, 180, 180 ) );
            break;
        }
    }
}

animal_race()
{
    animial_setup();
    start_animal_race();
}

animial_setup()
{
    level.animals = [];
    var_0 = getentarray( "animal_stick", "targetname" );

    foreach ( var_3, var_2 in var_0 )
    {
        level.animals[var_3] = getent( var_2.target, "targetname" );
        var_2 linkto( level.animals[var_3] );
        level.animals[var_3].original_pos = level.animals[var_3].origin;
    }

    level.animal_marquee_lights = getentarray( "animal_marquee_lights", "targetname" );
}

start_animal_race()
{
    level endon( "game_ended" );
    var_0 = getentarray( "accelerator", "targetname" );

    foreach ( var_2 in var_0 )
        level childthread monitor_accelerator_damage( var_2 );
}

monitor_accelerator_damage( var_0 )
{
    level endon( "race_over" );
    var_1 = getent( var_0.target, "targetname" );
    var_1.lightEnt = getent( var_1.targetname + "_light", "targetname" );
    var_2 = var_1.origin;
    var_3 = common_scripts\utility::getstruct( var_1.target, "targetname" );
    var_4 = abs( var_1.origin[1] - var_3.origin[1] ) / 80;
    var_5 = 0;

    for (;;)
    {
        var_0 waittill( "damage",  var_6, var_7  );

        if ( var_7 maps\mp\_utility::isEMPed() )
            continue;

        var_5 += var_4;
        var_8 = var_2 + ( 0, var_5, 0 );
        var_1 moveto( var_8, 0.25 );

        if ( distance2d( var_8, var_3.origin ) < var_4 )
        {
            var_1 waittill( "movedone" );
            level thread animal_race_victory( var_1 );
            break;
        }
    }
}

animal_race_victory( var_0 )
{
    level endon( "game_ended" );
    level notify( "race_over" );
    var_0.lightEnt setmodel( "bw_light_game_on" );

    if ( isdefined( var_0._ID6389 ) )
        thread create_exploder_play_fx( var_0._ID6389 );

    foreach ( var_2 in level.animal_marquee_lights )
        var_2 setmodel( "marquee_lights_yellow_flashing_fast" );

    wait 4;

    foreach ( var_5 in level.animals )
        var_5 moveto( var_5.original_pos, 5 );

    wait 5;
    var_0.lightEnt setmodel( "bw_light_game" );

    foreach ( var_2 in level.animal_marquee_lights )
        var_2 setmodel( "marquee_lights_white_flashing_slow" );

    level thread start_animal_race();
}

baseball_pitch()
{
    level endon( "game_ended" );
    var_0 = getentarray( "catcher", "targetname" );

    foreach ( var_2 in var_0 )
        level childthread monitor_catcher_damage( var_2 );
}

monitor_catcher_damage( var_0 )
{
    for (;;)
    {
        var_0 waittill( "damage" );

        if ( isdefined( var_0._ID6389 ) )
            thread create_exploder_play_fx( var_0._ID6389 );

        wait 3;
    }
}

create_exploder_play_fx( var_0 )
{
    switch ( var_0 )
    {
        case 1001:
            level.carnival_fx_location = level.carnival_fx_tag_01;
            level.carnivalgamefx = "mp_bw_clown01";
            break;
        case 1002:
            level.carnival_fx_location = level.carnival_fx_tag_02;
            level.carnivalgamefx = "mp_bw_clown02";
            break;
        case 1003:
            level.carnival_fx_location = level.carnival_fx_tag_03;
            level.carnivalgamefx = "mp_bw_clown03";
            break;
        case 1004:
            level.carnival_fx_location = level.carnival_fx_tag_04;
            level.carnivalgamefx = "mp_bw_clown04";
            break;
        case 1005:
            level.carnival_fx_location = level.carnival_fx_tag_05;
            level.carnivalgamefx = "mp_bw_clown05";
            break;
        case 2001:
            level.carnival_fx_location = level.carnival_fx_tag_06;
            level.carnivalgamefx = "mp_bw_game01";
            break;
        case 2002:
            level.carnival_fx_location = level.carnival_fx_tag_07;
            level.carnivalgamefx = "mp_bw_game02";
            break;
        case 2003:
            level.carnival_fx_location = level.carnival_fx_tag_08;
            level.carnivalgamefx = "mp_bw_game03";
            break;
    }

    playfxontagforclients( level._effect[level.carnivalgamefx], level.carnival_fx_location, "tag_origin", level.players );
}
