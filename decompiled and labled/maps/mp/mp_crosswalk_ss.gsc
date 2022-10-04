// IW5 PC GSC
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    maps\mp\mp_crosswalk_ss_precache::main();
    maps\createart\mp_crosswalk_ss_art::main();
    maps\mp\mp_crosswalk_ss_fx::main();
    maps\mp\_load::main();
    ambientplay( "ambient_mp_crosswalk" );
    maps\mp\_compass::setupMiniMap( "compass_map_mp_crosswalk_ss" );
    setdvar( "r_lightGridEnableTweaks", 1 );
    setdvar( "r_lightGridIntensity", 1.33 );
    setdvar( "sm_sunShadowScale", 0.8 );
    setdvar( "r_diffuseColorScale", 1.25 );
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    maps\mp\gametypes\faceoff::main( ::tdmspawnadjustments, ::ctfaxisspawnadjustments, ::ctfallyspawnadjustments, undefined, undefined );
    audio_settings();
    thread handle_police_car_lights();
}

audio_settings()
{
    maps\mp\_audio::add_reverb( "default", "city", 0.2, 0.9, 2 );
}

tdmspawnadjustments()
{
    maps\mp\gametypes\faceoff::createscriptspawnpoint( ( -348, -1632, 856 ), ( 0, 135, 0 ), "additional_spawn" );
    maps\mp\gametypes\faceoff::createscriptspawnpoint( ( -144, -1040, 856 ), ( 0, 90, 0 ), "additional_spawn" );
    maps\mp\gametypes\faceoff::createscriptspawnpoint( ( -1586.5, -1178.5, 856 ), ( 0, 90, 0 ), "additional_spawn" );
    maps\mp\gametypes\faceoff::createscriptspawnpoint( ( -1470.5, 594.5, 1008 ), ( 0, 0, 0 ), "additional_spawn" );
    maps\mp\gametypes\faceoff::createscriptspawnpoint( ( -1190, -1386, 848 ), ( 0, 140, 0 ), "additional_spawn" );
    maps\mp\gametypes\faceoff::createscriptspawnpoint( ( 521.7, 1006.6, 848 ), ( 0, 180, 0 ), "additional_spawn" );
    maps\mp\gametypes\faceoff::createscriptspawnpoint( ( -219.5, 1400.5, 856 ), ( 0, 285, 0 ), "additional_spawn" );
}

ctfaxisspawnadjustments()
{
    maps\mp\gametypes\faceoff::createscriptspawnpoint( ( -144, -1040, 872 ), ( 0, 90, 0 ), "additional_spawn_axis" );
}

ctfallyspawnadjustments()
{
    maps\mp\gametypes\faceoff::createscriptspawnpoint( ( -1868, 492, 852 ), ( 0, 270, 0 ), "additional_spawn_allies" );
}

local_fx_create( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( level._effect ) )
        level._effect = [];

    if ( !isdefined( level._effect[var_0] ) )
        level._effect[var_0] = loadfx( var_1 );

    if ( !isdefined( self.angles ) )
        self.angles = ( 0, 0, 0 );

    var_4 = common_scripts\utility::createLoopEffect( var_0 );
    var_4.v["origin"] = self.origin;
    var_4.v["angles"] = self.angles;
    var_4.v["fxid"] = var_0;
    var_4.v["delay"] = var_2;

    if ( isdefined( var_3 ) )
        var_4.v["soundalias"] = var_3;

    return var_4;
}

handle_police_car_lights()
{
    level.police_lights = [];
    var_0 = spawn( "script_origin", ( -2685.01, -556.571, 891.043 ) );
    var_0.angles = ( 277, 90, -179 );
    level.police_lights[level.police_lights.size] = var_0 local_fx_create( "Police_Cruiser_Lights2", "maps/mp_crosswalk_ss/mp_cw_policelights2", 1.2, undefined );
    var_0.origin = ( -797.731, 1284.58, 891.049 );
    var_0.angles = ( 270, 0, -156 );
    level.police_lights[level.police_lights.size] = var_0 local_fx_create( "Police_Cruiser_Lights2", "maps/mp_crosswalk_ss/mp_cw_policelights2", 1.2, undefined );
    var_1 = getentarray( "destructible_vehicle", "targetname" );

    foreach ( var_3 in var_1 )
    {
        if ( isdefined( var_3.model ) && var_3.model == "vehicle_policecar_lapd_destructible" )
            var_3 thread listen_for_destruction();
    }
}

listen_for_destruction()
{
    self waittill( "exploded" );

    foreach ( var_1 in level.police_lights )
    {
        if ( distance2d( self.origin, var_1.v["origin"] ) < 50 )
        {
            var_1.looper delete();
            level.police_lights = common_scripts\utility::array_remove( level.police_lights, var_1 );
            return;
        }
    }
}
