// IW5 PC GSC
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    maps\mp\mp_restrepo_ss_precache::main();
    maps\createart\mp_restrepo_ss_art::main();
    maps\mp\mp_restrepo_ss_fx::main();
    maps\mp\_load::main();
    ambientplay( "ambient_mp_outpost" );
    maps\mp\_compass::setupMiniMap( "compass_map_mp_restrepo_ss" );
    setdvar( "r_lightGridEnableTweaks", 1 );
    setdvar( "r_lightGridIntensity", 1.33 );

    if ( level.ps3 )
        setdvar( "sm_sunShadowScale", "0.7" );
    else
        setdvar( "sm_sunShadowScale", "0.8" );

    game["attackers"] = "allies";
    game["defenders"] = "axis";
    audio_settings();
    level thread minefields();
    level thread waitcarryobjects();
}

audio_settings()
{
    maps\mp\_audio::add_reverb( "default", "mountains", 0.25, 0.9, 2 );
}

minefields()
{
    var_0 = getentarray( "minefield_restrepo", "targetname" );

    if ( var_0.size > 0 )
        level._effect["mine_explosion"] = loadfx( "explosions/grenadeExp_dirt" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_0[var_1] thread minefield_think();
        var_0[var_1] thread minefield_destroyturrets();
    }
}

minefield_destroyturrets()
{
    level endon( "game_ended" );

    for (;;)
    {
        if ( isdefined( level.turrets ) )
        {
            foreach ( var_1 in level.turrets )
            {
                if ( var_1 istouching( self ) && !isdefined( var_1.minefieldtriggered ) )
                {
                    var_1.minefieldtriggered = 1;
                    radiusdamage( var_1.origin, 4, 2000, 2000, undefined, "MOD_EXPLOSIVE", "frag_grenade_mp" );
                    break;
                }
            }
        }

        wait 0.05;
    }
}

minefield_think()
{
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "trigger",  var_0  );
        childthread depoly_mine( var_0 );
    }
}

depoly_mine( var_0 )
{
    if ( isplayer( var_0 ) && isalive( var_0 ) && !isdefined( var_0.minefieldtriggered ) )
    {
        var_0.minefieldtriggered = 1;
        var_0.selectingLocation = 1;
        var_0 notify( "force_cancel_placement" );
        var_0 cancel_killstreak();
        var_1 = create_mine( var_0 );
        var_1 childthread minetrigger( var_0 );
        var_0 common_scripts\utility::waittill_any( "mine_clean_up", "death", "disconnect" );
        var_0.minefieldtriggered = undefined;
        var_0.selectingLocation = undefined;
        var_0 notify( "force_cancel_placement" );
        var_1 mine_cleanup();
    }
}

create_mine( var_0 )
{
    var_1 = var_0.origin + anglestoforward( var_0.angles ) * 70;
    var_2 = bullettrace( var_1 + ( 0, 0, 32 ), var_1 + ( 0, 0, -32 ), 0, undefined );
    var_1 = var_2["position"];
    var_3 = spawn( "script_model", var_1 );
    var_3.origin = var_1;
    var_3.angles = var_0.angles;
    var_3 setmodel( "projectile_bouncing_betty_grenade" );
    return var_3;
}

cancel_killstreak()
{
    if ( !isdefined( self.killstreakIndexWeapon ) )
        return;

    if ( !isdefined( self.pers["killstreaks"][self.killstreakIndexWeapon] ) || !isdefined( self.pers["killstreaks"][self.killstreakIndexWeapon].streakName ) )
        return;

    var_0 = self getcurrentweapon();
    var_1 = maps\mp\killstreaks\_killstreaks::getKillstreakWeapon( self.pers["killstreaks"][self.killstreakIndexWeapon].streakName );

    if ( var_0 == var_1 )
    {
        var_2 = maps\mp\killstreaks\_killstreaks::getFirstPrimaryWeapon();
        self switchtoweapon( var_2 );
    }
}

minetrigger( var_0 )
{
    var_0 endon( "disconnect" );
    var_0 endon( "death" );
    self playsound( "mine_betty_click" );
    wait 0.1;
    self playsound( "mine_betty_spin" );
    playfx( level.mine_launch, self.origin );
    var_1 = var_0 geteye() + anglestoforward( self.angles ) * 40;
    self moveto( var_1, 0.4, 0, 0.3 );
    self rotatevelocity( ( 0, 750, 32 ), 0.4, 0, 0.3 );
    thread playSpinnerFX();
    wait 0.4;
    self playsound( "grenade_explode_metal" );
    var_2 = self gettagorigin( "tag_fx" );
    playfx( level.mine_explode, var_2 );
    wait 0.05;
    self hide();
    wait 0.1;
    radiusdamage( var_0.origin, 32, 2000, 2000 );
    var_0 notify( "mine_clean_up" );
}

mine_cleanup()
{
    wait 0.2;
    self delete();
}

playSpinnerFX()
{
    self endon( "death" );
    var_0 = gettime() + 1000;

    while ( gettime() < var_0 )
    {
        wait 0.05;
        playfxontag( level.mine_spin, self, "tag_fx_spin1" );
        playfxontag( level.mine_spin, self, "tag_fx_spin3" );
        wait 0.05;
        playfxontag( level.mine_spin, self, "tag_fx_spin2" );
        playfxontag( level.mine_spin, self, "tag_fx_spin4" );
    }
}

waitcarryobjects()
{
    level endon( "game_ended" );

    if ( level.gameType == "sd" )
    {
        while ( !isdefined( level.sdBomb ) )
            wait 0.05;

        level.sdBomb thread watchcarryobjects();
    }
    else if ( level.gameType == "sab" )
    {
        while ( !isdefined( level.sabBomb ) )
            wait 0.05;

        level.sabBomb thread watchcarryobjects();
    }
    else if ( level.gameType == "tdef" )
    {
        while ( !isdefined( level.gameFlag ) )
            wait 0.05;

        level.gameFlag thread watchcarryobjects();
    }
    else if ( level.gameType == "ctf" )
    {
        while ( !isdefined( level.teamFlags ) || !isdefined( level.teamFlags[game["defenders"]] ) || !isdefined( level.teamFlags[game["attackers"]] ) )
            wait 0.05;

        level.teamFlags[game["defenders"]] thread watchcarryobjects();
        level.teamFlags[game["attackers"]] thread watchcarryobjects();
    }
}

watchcarryobjects()
{
    if ( !isdefined( level.nodroptriggers ) )
        getnodrops();

    for (;;)
    {
        self waittill( "dropped" );
        wait 0.1;

        foreach ( var_1 in level.nodroptriggers )
        {
            if ( self.visuals[0] istouching( var_1 ) )
            {
                if ( level.gameType == "tdef" )
                {
                    var_2 = common_scripts\utility::getstruct( var_1.target, "targetname" );
                    thread movecarryobject( var_2.origin, var_2.angles );
                }
                else
                    maps\mp\gametypes\_gameobjects::returnHome();

                break;
            }
        }
    }
}

getnodrops()
{
    level.nodroptriggers = [];
    var_0 = getentarray( "no_drop", "targetname" );

    foreach ( var_2 in var_0 )
    {
        if ( var_2.classname == "trigger_multiple" )
            level.nodroptriggers = common_scripts\utility::add_to_array( level.nodroptriggers, var_2 );
    }
}

movecarryobject( var_0, var_1 )
{
    self notify( "stop_pickup_timeout" );
    self notify( "picked_up" );
    self.isResetting = 1;

    for ( var_2 = 0; var_2 < self.visuals.size; var_2++ )
    {
        self.visuals[var_2].origin = var_0;
        self.visuals[var_2].angles = var_1;
        self.visuals[var_2] show();
    }

    self.trigger.origin = var_0;
    self.curOrigin = self.trigger.origin;
    maps\mp\gametypes\_gameobjects::clearCarrier();
    maps\mp\gametypes\_gameobjects::updateWorldIcons();
    maps\mp\gametypes\_gameobjects::updateCompassIcons();
    self.isResetting = 0;
}
