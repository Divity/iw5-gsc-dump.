// IW5 PC GSC
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("animated_props");

main()
{
    if ( !isdefined( level.anim_prop_models ) )
        level.anim_prop_models = [];

    var_0 = tolower( getdvar( "mapname" ) );
    var_1 = 1;

    if ( common_scripts\utility::string_starts_with( var_0, "mp_" ) )
        var_1 = 0;

    var_2 = "seatown_canopy_3section_01";

    if ( var_1 )
        level.anim_prop_models[var_2]["wind"] = %seatown_canopy_3section_01_sway;
    else
        level.anim_prop_models[var_2]["wind"] = "seatown_canopy_3section_01_sway";
}