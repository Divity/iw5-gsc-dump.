// IW5 PC GSC
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    maps\mp\mp_hillside_ss_precache::main();
    maps\createart\mp_hillside_ss_art::main();
    maps\mp\mp_hillside_ss_fx::main();
    maps\mp\_load::main();
    ambientplay( "ambient_mp_hillside" );
    maps\mp\_compass::setupMiniMap( "compass_map_mp_hillside_ss" );
    setdvar( "r_lightGridEnableTweaks", 1 );
    setdvar( "r_lightGridIntensity", 1.33 );
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    var_0 = getent( "trigger_underwater", "targetname" );
    var_1 = getent( "trigger_abovewater", "targetname" );
    var_0 thread watchplayerenterwater( var_1 );
    level thread clearwatervarsonspawn( var_0 );
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
            var_1.underwater = undefined;
            var_1 notify( "out_of_water" );
        }
    }
}

watchplayerenterwater( var_0 )
{
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "trigger",  var_1  );

        if ( !isplayer( var_1 ) )
        {
            if ( isdefined( var_1.heliType ) && var_1.heliType == "remote_uav" )
            {
                wait 0.25;
                var_1 notify( "death" );
            }
            else if ( isdefined( var_1.tankType ) && var_1.tankType == "remote_tank" )
            {
                wait 0.25;
                var_1 notify( "death" );
            }

            continue;
        }

        if ( !isalive( var_1 ) )
            continue;

        if ( !isdefined( var_1._ID7818 ) )
        {
            var_1._ID7818 = 1;
            var_1 thread playerinwater( self, var_0 );
        }
    }
}

playerinwater( var_0, var_1 )
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    thread inwaterwake();
    thread playerwaterclearwait();
    self notify( "force_cancel_placement" );

    for (;;)
    {
        if ( !self istouching( var_0 ) )
        {
            self._ID7818 = undefined;
            self.underwater = undefined;
            self notify( "out_of_water" );
            break;
        }

        if ( !isdefined( self.underwater ) && !self istouching( var_1 ) )
        {
            self.underwater = 1;
            thread clearselectinglocationonremotedeathspawn();
            thread playerunderwater();
        }

        if ( isdefined( self.underwater ) && self istouching( var_1 ) )
        {
            self.underwater = undefined;
            self notify( "above_water" );
            self stopshellshock();
            self playlocalsound( "breathing_better" );
            playfx( level._effect["water_splash_emerge"], self.origin * ( 1, 1, 0 ) + ( 0, 0, 2213 ) );
        }

        if ( isdefined( self.underwater ) || isactivekillstreakpoolrestricted( self ) )
            self.selectingLocation = 1;
        else if ( !isdefined( self.underwater ) )
            self.selectingLocation = undefined;

        wait 0.05;
    }
}

isactivekillstreakpoolrestricted( var_0 )
{
    if ( isdefined( var_0.killstreakIndexWeapon ) )
    {
        var_1 = self.pers["killstreaks"][self.killstreakIndexWeapon].streakName;

        if ( isdefined( var_1 ) )
        {
            switch ( var_1 )
            {
                case "remote_uav":
                case "remote_tank":
                case "remote_mg_turret":
                case "minigun_turret":
                case "ims":
                case "sentry":
                case "sam_turret":
                    return 1;
            }
        }
    }

    return 0;
}

playerwaterclearwait()
{
    common_scripts\utility::waittill_any( "death", "disconnect", "out_of_water" );
    self._ID7818 = undefined;
    self.underwater = undefined;
    self.selectingLocation = undefined;
}

inwaterwake()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "out_of_water" );
    playfx( level._effect["water_splash_enter"], self.origin );

    for (;;)
    {
        playfx( level._effect["water_wake"], self.origin * ( 1, 1, 0 ) + ( 0, 0, 2213 ) );
        wait 0.75;
    }
}

playerunderwater()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "stopped_using_remote" );
    self endon( "disconnect" );
    self endon( "above_water" );

    if ( !maps\mp\_utility::isUsingRemote() )
    {
        self shellshock( "default", 8 );
        thread underwaterbubbles();
        thread stopshellshockonremote();
    }

    wait 2;
    thread onplayerdrowned();

    for (;;)
    {
        radiusdamage( self.origin + anglestoforward( self.angles ) * 5, 16, 20, 20, undefined, "MOD_TRIGGER_HURT" );
        wait 1;
    }
}

onplayerdrowned()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "above_water" );
    self waittill( "death" );
    self._ID7818 = undefined;
    self.underwater = undefined;
}

underwaterbubbles()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "using_remote" );
    self endon( "stopped_using_remote" );
    self endon( "disconnect" );
    self endon( "above_water" );

    for (;;)
    {
        playfx( level._effect["water_bubbles"], self geteye() + anglestoup( self.angles ) * -13 + anglestoforward( self.angles ) * 25 );
        wait 0.75;
    }
}

stopshellshockonremote()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "stopped_using_remote" );
    self endon( "disconnect" );
    self endon( "above_water" );
    self waittill( "using_remote" );
    self stopshellshock();
}

clearselectinglocationonremotedeathspawn()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self waittill( "spawned_player" );
    self.selectingLocation = undefined;
}
