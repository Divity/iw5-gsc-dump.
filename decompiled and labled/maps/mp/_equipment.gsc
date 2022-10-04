// IW5 PC GSC
// Decompiled by https://github.com/xensik/gsc-tool

watchTrophyUsage()
{
    self endon( "spawned_player" );
    self endon( "disconnect" );
    self.trophyArray = [];

    for (;;)
    {
        self waittill( "grenade_fire",  var_0, var_1  );

        if ( var_1 == "trophy" || var_1 == "trophy_mp" )
        {
            if ( !isalive( self ) )
            {
                var_0 delete();
                return;
            }

            var_0 hide();
            var_0 waittill( "missile_stuck" );
            var_2 = 40;

            if ( var_2 * var_2 < distancesquared( var_0.origin, self.origin ) )
            {
                var_3 = bullettrace( self.origin, self.origin - ( 0, 0, var_2 ), 0, self );

                if ( var_3["fraction"] == 1 )
                {
                    var_0 delete();
                    self setweaponammostock( "trophy_mp", self getweaponammostock( "trophy_mp" ) + 1 );
                    continue;
                }

                var_0.origin = var_3["position"];
            }

            var_0 show();
            self.trophyArray = common_scripts\utility::array_removeUndefined( self.trophyArray );

            if ( self.trophyArray.size >= level.maxPerPlayerExplosives )
                self.trophyArray[0] detonate();

            var_4 = spawn( "script_model", var_0.origin );
            var_4 setmodel( "mp_trophy_system" );
            var_4 thread maps\mp\gametypes\_weapons::createBombSquadModel( "mp_trophy_system_bombsquad", "tag_origin", level.otherTeam[self.team], self );
            var_4.angles = var_0.angles;
            self.trophyArray[self.trophyArray.size] = var_4;
            var_4.owner = self;
            var_4.team = self.team;
            var_4.weaponName = var_1;

            if ( isdefined( self.trophyRemainingAmmo ) && self.trophyRemainingAmmo > 0 )
                var_4.ammo = self.trophyRemainingAmmo;
            else
                var_4.ammo = 2;

            var_4.trigger = spawn( "script_origin", var_4.origin );
            var_4 thread trophyDamage( self );
            var_4 thread trophyActive( self );
            var_4 thread trophyDisconnectWaiter( self );
            var_4 thread trophyPlayerSpawnWaiter( self );
            var_4 thread trophyUseListener( self );
            var_4 thread maps\mp\gametypes\_weapons::c4EMPKillstreakWait();

            if ( level.teamBased )
                var_4 maps\mp\_entityheadicons::setTeamHeadIcon( var_4.team, ( 0, 0, 65 ) );
            else
                var_4 maps\mp\_entityheadicons::setPlayerHeadIcon( var_4.owner, ( 0, 0, 65 ) );

            wait 0.05;

            if ( isdefined( var_0 ) )
                var_0 delete();
        }
    }
}

trophyUseListener( var_0 )
{
    self endon( "death" );
    level endon( "game_ended" );
    var_0 endon( "disconnect" );
    var_0 endon( "death" );
    self.trigger setcursorhint( "HINT_NOICON" );
    self.trigger sethintstring( &"MP_PICKUP_TROPHY" );
    self.trigger maps\mp\_utility::setSelfUsable( var_0 );
    self.trigger thread maps\mp\_utility::notUsableForJoiningPlayers( var_0 );

    for (;;)
    {
        self.trigger waittill( "trigger",  var_0  );
        var_0 playlocalsound( "scavenger_pack_pickup" );
        var_0 maps\mp\_utility::givePerk( "trophy_mp", 0 );
        var_0.trophyRemainingAmmo = self.ammo;
        self.trigger delete();
        self delete();
        self notify( "death" );
    }
}

trophyPlayerSpawnWaiter( var_0 )
{
    self endon( "disconnect" );
    self endon( "death" );
    var_0 waittill( "spawned" );
    thread trophyBreak();
}

trophyDisconnectWaiter( var_0 )
{
    self endon( "death" );
    var_0 waittill( "disconnect" );
    thread trophyBreak();
}

trophyActive( var_0 )
{
    var_0 endon( "disconnect" );
    self endon( "death" );
    var_1 = self.origin;

    for (;;)
    {
        if ( !isdefined( level.grenades ) || level.grenades.size < 1 && level.missiles.size < 1 || isdefined( self.disabled ) )
        {
            wait 0.05;
            continue;
        }

        var_2 = maps\mp\_utility::combineArrays( level.grenades, level.missiles );

        foreach ( var_4 in var_2 )
        {
            wait 0.05;

            if ( !isdefined( var_4 ) )
                continue;

            if ( var_4 == self )
                continue;

            if ( isdefined( var_4.weaponName ) )
            {
                switch ( var_4.weaponName )
                {
                    case "claymore_mp":
                        continue;
                }
            }

            switch ( var_4.model )
            {
                case "weapon_parabolic_knife":
                case "weapon_jammer":
                case "weapon_radar":
                case "mp_trophy_system":
                    continue;
            }

            if ( !isdefined( var_4.owner ) )
                var_4.owner = getmissileowner( var_4 );

            if ( isdefined( var_4.owner ) && level.teamBased && var_4.owner.team == var_0.team )
                continue;

            if ( isdefined( var_4.owner ) && var_4.owner == var_0 )
                continue;

            var_5 = distancesquared( var_4.origin, self.origin );

            if ( var_5 < 147456 )
            {
                if ( bullettracepassed( var_4.origin, self.origin, 0, self ) )
                {
                    playfx( level.sentry_fire, self.origin + ( 0, 0, 32 ), var_4.origin - self.origin, anglestoup( self.angles ) );
                    self playsound( "trophy_detect_projectile" );
                    var_0 thread projectileExplode( var_4, self );
                    var_0 maps\mp\gametypes\_missions::processChallenge( "ch_noboomforyou" );
                    self.ammo--;

                    if ( self.ammo <= 0 )
                        thread trophyBreak();
                }
            }
        }
    }
}

projectileExplode( var_0, var_1 )
{
    self endon( "death" );
    var_2 = var_0.origin;
    var_3 = var_0.model;
    var_4 = var_0.angles;

    if ( var_3 == "weapon_light_marker" )
    {
        playfx( level.empGrenadeExplode, var_2, anglestoforward( var_4 ), anglestoup( var_4 ) );
        var_1 thread trophyBreak();
        var_0 delete();
        return;
    }

    var_0 delete();
    var_1 playsound( "trophy_fire" );
    playfx( level.mine_explode, var_2, anglestoforward( var_4 ), anglestoup( var_4 ) );
    radiusdamage( var_2, 128, 105, 10, self, "MOD_EXPLOSIVE", "trophy_mp" );
}

trophyDamage( var_0 )
{
    self endon( "death" );
    var_0 endon( "death" );
    self setcandamage( 1 );
    self.health = 999999;
    self.maxHealth = 100;
    self.damagetaken = 0;

    for (;;)
    {
        self waittill( "damage",  var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10  );

        if ( !isplayer( var_2 ) )
            continue;

        if ( !maps\mp\gametypes\_weapons::friendlyFireCheck( self.owner, var_2 ) )
            continue;

        if ( isdefined( var_10 ) )
        {
            switch ( var_10 )
            {
                case "concussion_grenade_mp":
                case "smoke_grenade_mp":
                case "flash_grenade_mp":
                    continue;
            }
        }

        if ( !isdefined( self ) )
            return;

        if ( var_5 == "MOD_MELEE" )
            self.damagetaken = self.damagetaken + self.maxHealth;

        if ( isdefined( var_9 ) && var_9 & level.iDFLAGS_PENETRATION )
            self.wasDamagedFromBulletPenetration = 1;

        self.wasDamaged = 1;

        if ( isdefined( var_10 ) && var_10 == "emp_grenade_mp" )
            self.damagetaken = self.damagetaken + self.maxHealth;

        self.damagetaken = self.damagetaken + var_1;

        if ( isplayer( var_2 ) )
            var_2 maps\mp\gametypes\_damagefeedback::updateDamageFeedback( "trophy" );

        if ( self.damagetaken >= self.maxHealth )
        {
            var_2 notify( "destroyed_explosive" );
            thread trophyBreak();
        }
    }
}

trophyBreak()
{
    playfxontag( common_scripts\utility::getfx( "sentry_explode_mp" ), self, "tag_origin" );
    playfxontag( common_scripts\utility::getfx( "sentry_smoke_mp" ), self, "tag_origin" );
    self playsound( "sentry_explode" );
    self notify( "death" );
    var_0 = self.origin;
    self.trigger makeunusable();
    wait 3;

    if ( isdefined( self.trigger ) )
        self.trigger delete();

    if ( isdefined( self ) )
        self delete();
}
