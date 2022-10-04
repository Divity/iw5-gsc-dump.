// IW5 PC GSC
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    level.perkFuncs = [];
    precacheshader( "combathigh_overlay" );
    precacheshader( "specialty_juiced" );
    precacheshader( "compassping_revenge" );
    precacheshader( "specialty_c4death" );
    precacheshader( "specialty_finalstand" );
    precachemodel( "weapon_riot_shield_mp" );
    precachemodel( "viewmodel_riot_shield_mp" );
    precachestring( &"MPUI_CHANGING_KIT" );
    level.precacheModel["enemy"] = "mil_emergency_flare_mp";
    level.precacheModel["friendly"] = "mil_emergency_flare_mp";
    level.spawnGlow["enemy"] = loadfx( "misc/flare_ambient" );
    level.spawnGlow["friendly"] = loadfx( "misc/flare_ambient_green" );
    level.c4Death = loadfx( "explosions/javelin_explosion" );
    level.spawnFire = loadfx( "props/barrelexp" );
    precachemodel( level.precacheModel["friendly"] );
    precachemodel( level.precacheModel["enemy"] );
    precachestring( &"MP_DESTROY_TI" );
    precacheShaders();
    level._effect["ricochet"] = loadfx( "impacts/large_metalhit_1" );
    level.scriptPerks = [];
    level.perkSetFuncs = [];
    level.perkUnsetFuncs = [];
    level.fauxPerks = [];
    level.scriptPerks["specialty_blastshield"] = 1;
    level.scriptPerks["_specialty_blastshield"] = 1;
    level.scriptPerks["specialty_akimbo"] = 1;
    level.scriptPerks["specialty_siege"] = 1;
    level.scriptPerks["specialty_falldamage"] = 1;
    level.scriptPerks["specialty_shield"] = 1;
    level.scriptPerks["specialty_feigndeath"] = 1;
    level.scriptPerks["specialty_shellshock"] = 1;
    level.scriptPerks["specialty_delaymine"] = 1;
    level.scriptPerks["specialty_localjammer"] = 1;
    level.scriptPerks["specialty_thermal"] = 1;
    level.scriptPerks["specialty_blackbox"] = 1;
    level.scriptPerks["specialty_steelnerves"] = 1;
    level.scriptPerks["specialty_flashgrenade"] = 1;
    level.scriptPerks["specialty_smokegrenade"] = 1;
    level.scriptPerks["specialty_concussiongrenade"] = 1;
    level.scriptPerks["specialty_challenger"] = 1;
    level.scriptPerks["specialty_saboteur"] = 1;
    level.scriptPerks["specialty_endgame"] = 1;
    level.scriptPerks["specialty_rearview"] = 1;
    level.scriptPerks["specialty_hardline"] = 1;
    level.scriptPerks["specialty_ac130"] = 1;
    level.scriptPerks["specialty_sentry_minigun"] = 1;
    level.scriptPerks["specialty_predator_missile"] = 1;
    level.scriptPerks["specialty_helicopter_minigun"] = 1;
    level.scriptPerks["specialty_tank"] = 1;
    level.scriptPerks["specialty_precision_airstrike"] = 1;
    level.scriptPerks["specialty_onemanarmy"] = 1;
    level.scriptPerks["specialty_littlebird_support"] = 1;
    level.scriptPerks["specialty_primarydeath"] = 1;
    level.scriptPerks["specialty_secondarybling"] = 1;
    level.scriptPerks["specialty_explosivedamage"] = 1;
    level.scriptPerks["specialty_laststandoffhand"] = 1;
    level.scriptPerks["specialty_dangerclose"] = 1;
    level.scriptPerks["specialty_luckycharm"] = 1;
    level.scriptPerks["specialty_hardjack"] = 1;
    level.scriptPerks["specialty_extraspecialduration"] = 1;
    level.scriptPerks["specialty_rollover"] = 1;
    level.scriptPerks["specialty_armorpiercing"] = 1;
    level.scriptPerks["specialty_omaquickchange"] = 1;
    level.scriptPerks["_specialty_rearview"] = 1;
    level.scriptPerks["_specialty_onemanarmy"] = 1;
    level.scriptPerks["specialty_steadyaimpro"] = 1;
    level.scriptPerks["specialty_stun_resistance"] = 1;
    level.scriptPerks["specialty_double_load"] = 1;
    level.scriptPerks["specialty_hard_shell"] = 1;
    level.scriptPerks["specialty_regenspeed"] = 1;
    level.scriptPerks["specialty_twoprimaries"] = 1;
    level.scriptPerks["specialty_autospot"] = 1;
    level.scriptPerks["specialty_overkillpro"] = 1;
    level.scriptPerks["specialty_anytwo"] = 1;
    level.scriptPerks["specialty_assists"] = 1;
    level.scriptPerks["specialty_fasterlockon"] = 1;
    level.scriptPerks["specialty_paint"] = 1;
    level.scriptPerks["specialty_paint_pro"] = 1;
    level.fauxPerks["specialty_shield"] = 1;
    level.scriptPerks["specialty_marksman"] = 1;
    level.scriptPerks["specialty_sharp_focus"] = 1;
    level.scriptPerks["specialty_bling"] = 1;
    level.scriptPerks["specialty_moredamage"] = 1;
    level.scriptPerks["specialty_copycat"] = 1;
    level.scriptPerks["specialty_combathigh"] = 1;
    level.scriptPerks["specialty_finalstand"] = 1;
    level.scriptPerks["specialty_c4death"] = 1;
    level.scriptPerks["specialty_juiced"] = 1;
    level.scriptPerks["specialty_revenge"] = 1;
    level.scriptPerks["specialty_light_armor"] = 1;
    level.scriptPerks["specialty_carepackage"] = 1;
    level.scriptPerks["specialty_stopping_power"] = 1;
    level.scriptPerks["specialty_uav"] = 1;
    level.scriptPerks["bouncingbetty_mp"] = 1;
    level.scriptPerks["c4_mp"] = 1;
    level.scriptPerks["claymore_mp"] = 1;
    level.scriptPerks["frag_grenade_mp"] = 1;
    level.scriptPerks["semtex_mp"] = 1;
    level.scriptPerks["throwingknife_mp"] = 1;
    level.scriptPerks["concussion_grenade_mp"] = 1;
    level.scriptPerks["flash_grenade_mp"] = 1;
    level.scriptPerks["smoke_grenade_mp"] = 1;
    level.scriptPerks["specialty_portable_radar"] = 1;
    level.scriptPerks["specialty_scrambler"] = 1;
    level.scriptPerks["specialty_tacticalinsertion"] = 1;
    level.scriptPerks["trophy_mp"] = 1;
    level.scriptPerks["specialty_null"] = 1;
    level.perkSetFuncs["specialty_blastshield"] = maps\mp\perks\_perkfunctions::setBlastShield;
    level.perkUnsetFuncs["specialty_blastshield"] = maps\mp\perks\_perkfunctions::unsetBlastShield;
    level.perkSetFuncs["specialty_siege"] = maps\mp\perks\_perkfunctions::setSiege;
    level.perkUnsetFuncs["specialty_siege"] = maps\mp\perks\_perkfunctions::unsetSiege;
    level.perkSetFuncs["specialty_falldamage"] = maps\mp\perks\_perkfunctions::setFreefall;
    level.perkUnsetFuncs["specialty_falldamage"] = maps\mp\perks\_perkfunctions::unsetFreefall;
    level.perkSetFuncs["specialty_localjammer"] = maps\mp\perks\_perkfunctions::setLocalJammer;
    level.perkUnsetFuncs["specialty_localjammer"] = maps\mp\perks\_perkfunctions::unsetLocalJammer;
    level.perkSetFuncs["specialty_thermal"] = maps\mp\perks\_perkfunctions::setThermal;
    level.perkUnsetFuncs["specialty_thermal"] = maps\mp\perks\_perkfunctions::unsetThermal;
    level.perkSetFuncs["specialty_blackbox"] = maps\mp\perks\_perkfunctions::setBlackBox;
    level.perkUnsetFuncs["specialty_blackbox"] = maps\mp\perks\_perkfunctions::unsetBlackBox;
    level.perkSetFuncs["specialty_lightweight"] = maps\mp\perks\_perkfunctions::setLightWeight;
    level.perkUnsetFuncs["specialty_lightweight"] = maps\mp\perks\_perkfunctions::unsetLightWeight;
    level.perkSetFuncs["specialty_steelnerves"] = maps\mp\perks\_perkfunctions::setSteelNerves;
    level.perkUnsetFuncs["specialty_steelnerves"] = maps\mp\perks\_perkfunctions::unsetSteelNerves;
    level.perkSetFuncs["specialty_delaymine"] = maps\mp\perks\_perkfunctions::setDelayMine;
    level.perkUnsetFuncs["specialty_delaymine"] = maps\mp\perks\_perkfunctions::unsetDelayMine;
    level.perkSetFuncs["specialty_challenger"] = maps\mp\perks\_perkfunctions::setChallenger;
    level.perkUnsetFuncs["specialty_challenger"] = maps\mp\perks\_perkfunctions::unsetChallenger;
    level.perkSetFuncs["specialty_saboteur"] = maps\mp\perks\_perkfunctions::setSaboteur;
    level.perkUnsetFuncs["specialty_saboteur"] = maps\mp\perks\_perkfunctions::unsetSaboteur;
    level.perkSetFuncs["specialty_endgame"] = maps\mp\perks\_perkfunctions::setEndGame;
    level.perkUnsetFuncs["specialty_endgame"] = maps\mp\perks\_perkfunctions::unsetEndGame;
    level.perkSetFuncs["specialty_rearview"] = maps\mp\perks\_perkfunctions::setRearView;
    level.perkUnsetFuncs["specialty_rearview"] = maps\mp\perks\_perkfunctions::unsetRearView;
    level.perkSetFuncs["specialty_ac130"] = maps\mp\perks\_perkfunctions::setAC130;
    level.perkUnsetFuncs["specialty_ac130"] = maps\mp\perks\_perkfunctions::unsetAC130;
    level.perkSetFuncs["specialty_sentry_minigun"] = maps\mp\perks\_perkfunctions::setSentryMinigun;
    level.perkUnsetFuncs["specialty_sentry_minigun"] = maps\mp\perks\_perkfunctions::unsetSentryMinigun;
    level.perkSetFuncs["specialty_predator_missile"] = maps\mp\perks\_perkfunctions::setPredatorMissile;
    level.perkUnsetFuncs["specialty_predator_missile"] = maps\mp\perks\_perkfunctions::unsetPredatorMissile;
    level.perkSetFuncs["specialty_tank"] = maps\mp\perks\_perkfunctions::setTank;
    level.perkUnsetFuncs["specialty_tank"] = maps\mp\perks\_perkfunctions::unsetTank;
    level.perkSetFuncs["specialty_precision_airstrike"] = maps\mp\perks\_perkfunctions::setPrecision_airstrike;
    level.perkUnsetFuncs["specialty_precision_airstrike"] = maps\mp\perks\_perkfunctions::unsetPrecision_airstrike;
    level.perkSetFuncs["specialty_helicopter_minigun"] = maps\mp\perks\_perkfunctions::setHelicopterMinigun;
    level.perkUnsetFuncs["specialty_helicopter_minigun"] = maps\mp\perks\_perkfunctions::unsetHelicopterMinigun;
    level.perkSetFuncs["specialty_onemanarmy"] = maps\mp\perks\_perkfunctions::setOneManArmy;
    level.perkUnsetFuncs["specialty_onemanarmy"] = maps\mp\perks\_perkfunctions::unsetOneManArmy;
    level.perkSetFuncs["specialty_littlebird_support"] = maps\mp\perks\_perkfunctions::setLittlebirdSupport;
    level.perkUnsetFuncs["specialty_littlebird_support"] = maps\mp\perks\_perkfunctions::unsetLittlebirdSupport;
    level.perkSetFuncs["specialty_tacticalinsertion"] = maps\mp\perks\_perkfunctions::setTacticalInsertion;
    level.perkUnsetFuncs["specialty_tacticalinsertion"] = maps\mp\perks\_perkfunctions::unsetTacticalInsertion;
    level.perkSetFuncs["specialty_scrambler"] = maps\mp\gametypes\_scrambler::setScrambler;
    level.perkUnsetFuncs["specialty_scrambler"] = maps\mp\gametypes\_scrambler::unsetScrambler;
    level.perkSetFuncs["specialty_portable_radar"] = maps\mp\gametypes\_portable_radar::setPortableRadar;
    level.perkUnsetFuncs["specialty_portable_radar"] = maps\mp\gametypes\_portable_radar::unsetPortableRadar;
    level.perkSetFuncs["specialty_steadyaimpro"] = maps\mp\perks\_perkfunctions::setSteadyAimPro;
    level.perkUnsetFuncs["specialty_steadyaimpro"] = maps\mp\perks\_perkfunctions::unsetSteadyAimPro;
    level.perkSetFuncs["specialty_stun_resistance"] = maps\mp\perks\_perkfunctions::setStunResistance;
    level.perkUnsetFuncs["specialty_stun_resistance"] = maps\mp\perks\_perkfunctions::unsetStunResistance;
    level.perkSetFuncs["specialty_marksman"] = maps\mp\perks\_perkfunctions::setMarksman;
    level.perkUnsetFuncs["specialty_marksman"] = maps\mp\perks\_perkfunctions::unsetMarksman;
    level.perkSetFuncs["specialty_double_load"] = maps\mp\perks\_perkfunctions::setDoubleLoad;
    level.perkUnsetFuncs["specialty_double_load"] = maps\mp\perks\_perkfunctions::unsetDoubleLoad;
    level.perkSetFuncs["specialty_sharp_focus"] = maps\mp\perks\_perkfunctions::setSharpFocus;
    level.perkUnsetFuncs["specialty_sharp_focus"] = maps\mp\perks\_perkfunctions::unsetSharpFocus;
    level.perkSetFuncs["specialty_hard_shell"] = maps\mp\perks\_perkfunctions::setHardShell;
    level.perkUnsetFuncs["specialty_hard_shell"] = maps\mp\perks\_perkfunctions::unsetHardShell;
    level.perkSetFuncs["specialty_regenspeed"] = maps\mp\perks\_perkfunctions::setRegenSpeed;
    level.perkUnsetFuncs["specialty_regenspeed"] = maps\mp\perks\_perkfunctions::unsetRegenSpeed;
    level.perkSetFuncs["specialty_autospot"] = maps\mp\perks\_perkfunctions::setAutoSpot;
    level.perkUnsetFuncs["specialty_autospot"] = maps\mp\perks\_perkfunctions::unsetAutoSpot;
    level.perkSetFuncs["specialty_empimmune"] = maps\mp\perks\_perkfunctions::setEmpImmune;
    level.perkUnsetFuncs["specialty_empimmune"] = maps\mp\perks\_perkfunctions::unsetEmpImmune;
    level.perkSetFuncs["specialty_overkill_pro"] = maps\mp\perks\_perkfunctions::setOverkillPro;
    level.perkUnsetFuncs["specialty_overkill_pro"] = maps\mp\perks\_perkfunctions::unsetOverkillPro;
    level.perkSetFuncs["specialty_combathigh"] = maps\mp\perks\_perkfunctions::setCombatHigh;
    level.perkUnsetFuncs["specialty_combathigh"] = maps\mp\perks\_perkfunctions::unsetCombatHigh;
    level.perkSetFuncs["specialty_light_armor"] = maps\mp\perks\_perkfunctions::setLightArmor;
    level.perkUnsetFuncs["specialty_light_armor"] = maps\mp\perks\_perkfunctions::unsetLightArmor;
    level.perkSetFuncs["specialty_revenge"] = maps\mp\perks\_perkfunctions::setRevenge;
    level.perkUnsetFuncs["specialty_revenge"] = maps\mp\perks\_perkfunctions::unsetRevenge;
    level.perkSetFuncs["specialty_c4death"] = maps\mp\perks\_perkfunctions::setC4Death;
    level.perkUnsetFuncs["specialty_c4death"] = maps\mp\perks\_perkfunctions::unsetC4Death;
    level.perkSetFuncs["specialty_finalstand"] = maps\mp\perks\_perkfunctions::setFinalStand;
    level.perkUnsetFuncs["specialty_finalstand"] = maps\mp\perks\_perkfunctions::unsetFinalStand;
    level.perkSetFuncs["specialty_juiced"] = maps\mp\perks\_perkfunctions::setJuiced;
    level.perkUnsetFuncs["specialty_juiced"] = maps\mp\perks\_perkfunctions::unsetJuiced;
    level.perkSetFuncs["specialty_carepackage"] = maps\mp\perks\_perkfunctions::setCarePackage;
    level.perkUnsetFuncs["specialty_carepackage"] = maps\mp\perks\_perkfunctions::unsetCarePackage;
    level.perkSetFuncs["specialty_stopping_power"] = maps\mp\perks\_perkfunctions::setStoppingPower;
    level.perkUnsetFuncs["specialty_stopping_power"] = maps\mp\perks\_perkfunctions::unsetStoppingPower;
    level.perkSetFuncs["specialty_uav"] = maps\mp\perks\_perkfunctions::setUAV;
    level.perkUnsetFuncs["specialty_uav"] = maps\mp\perks\_perkfunctions::unsetUAV;
    initPerkDvars();
    level thread onPlayerConnect();
}

precacheShaders()
{
    precacheshader( "specialty_blastshield" );
}

validatePerk( var_0, var_1 )
{
    if ( getdvarint( "scr_game_perks" ) == 0 )
    {
        if ( tablelookup( "mp/perkTable.csv", 1, var_1, 5 ) != "equipment" )
            return "specialty_null";
    }

    return var_1;
}

onPlayerConnect()
{
    for (;;)
    {
        level waittill( "connected",  var_0  );
        var_0 thread onPlayerSpawned();
    }
}

onPlayerSpawned()
{
    self endon( "disconnect" );
    self.perks = [];
    self.weaponList = [];
    self.omaClassChanged = 0;

    for (;;)
    {
        self waittill( "spawned_player" );
        self.omaClassChanged = 0;
        thread playerProximityTracker();
        thread maps\mp\gametypes\_scrambler::scramblerProximityTracker();
    }
}

playerProximityTracker()
{
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "faux_spawn" );
    level endon( "game_ended" );
    self.proximityActive = 0;

    for (;;)
    {
        foreach ( var_1 in level.players )
        {
            wait 0.05;

            if ( !isdefined( var_1 ) )
                continue;

            if ( var_1.team != self.team )
                continue;

            if ( var_1 == self )
                continue;

            if ( !maps\mp\_utility::isReallyAlive( var_1 ) )
                continue;

            if ( !maps\mp\_utility::isReallyAlive( self ) )
                continue;

            var_2 = distancesquared( var_1.origin, self.origin );

            if ( var_2 < 262144 )
            {
                self.proximityActive = 1;
                break;
            }
        }

        wait 0.25;
    }
}

drawLine( var_0, var_1, var_2 )
{
    var_3 = int( var_2 * 20 );

    for ( var_4 = 0; var_4 < var_3; var_4++ )
        wait 0.05;
}

cac_modified_damage( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    var_8 = 0;

    if ( maps\mp\_utility::isBulletDamage( var_3 ) )
    {
        if ( isplayer( var_1 ) && var_1 maps\mp\_utility::_hasPerk( "specialty_paint_pro" ) && !maps\mp\_utility::isKillstreakWeapon( var_4 ) )
        {
            if ( !var_0 maps\mp\perks\_perkfunctions::isPainted() )
                var_1 maps\mp\gametypes\_missions::processChallenge( "ch_bulletpaint" );

            var_0 thread maps\mp\perks\_perkfunctions::setPainted();
        }

        if ( isplayer( var_1 ) && isdefined( var_4 ) && maps\mp\_utility::getWeaponClass( var_4 ) == "weapon_sniper" && issubstr( var_4, "silencer" ) )
            var_2 *= 0.75;

        if ( isplayer( var_1 ) && ( var_1 maps\mp\_utility::_hasPerk( "specialty_stopping_power" ) && var_1 maps\mp\_utility::_hasPerk( "specialty_bulletdamage" ) || var_1 maps\mp\_utility::_hasPerk( "specialty_moredamage" ) ) )
            var_2 += var_2 * level.bulletDamageMod;

        if ( var_0 maps\mp\_utility::isJuggernaut() )
            var_2 *= level.armorVestMod;
    }
    else if ( isexplosivedamagemod( var_3 ) )
    {
        if ( isplayer( var_1 ) && var_1 != var_0 && var_1 isitemunlocked( "specialty_paint" ) && var_1 maps\mp\_utility::_hasPerk( "specialty_paint" ) && !maps\mp\_utility::isKillstreakWeapon( var_4 ) )
        {
            if ( !var_0 maps\mp\perks\_perkfunctions::isPainted() )
                var_1 maps\mp\gametypes\_missions::processChallenge( "ch_paint_pro" );

            var_0 thread maps\mp\perks\_perkfunctions::setPainted();
        }

        if ( isplayer( var_1 ) && weaponinheritsperks( var_4 ) && var_1 maps\mp\_utility::_hasPerk( "specialty_explosivedamage" ) && var_0 maps\mp\_utility::_hasPerk( "_specialty_blastshield" ) )
            var_8 += 0;
        else if ( isplayer( var_1 ) && weaponinheritsperks( var_4 ) && var_1 maps\mp\_utility::_hasPerk( "specialty_explosivedamage" ) )
            var_8 += var_2 * level.explosiveDamageMod;
        else if ( var_0 maps\mp\_utility::_hasPerk( "_specialty_blastshield" ) && ( var_4 != "semtex_mp" || var_2 != 120 ) )
            var_8 -= int( var_2 * ( 1 - level.blastShieldMod ) );

        if ( maps\mp\_utility::isKillstreakWeapon( var_4 ) && isplayer( var_1 ) && var_1 maps\mp\_utility::_hasPerk( "specialty_dangerclose" ) )
            var_8 += var_2 * level.dangerCloseMod;

        if ( var_0 maps\mp\_utility::isJuggernaut() )
        {
            switch ( var_4 )
            {
                case "ac130_25mm_mp":
                    var_2 *= level.armorVestMod;
                    break;
                case "remote_mortar_missile_mp":
                    var_2 *= 0.2;
                    break;
                default:
                    if ( var_2 < 1000 )
                    {
                        if ( var_2 > 1 )
                            var_2 *= level.armorVestMod;
                    }

                    break;
            }
        }

        if ( 10 - ( level.gracePeriod - level.inGracePeriod ) > 0 )
            var_2 *= level.armorVestMod;
    }
    else if ( var_3 == "MOD_FALLING" )
    {
        if ( var_0 isitemunlocked( "specialty_falldamage" ) && var_0 maps\mp\_utility::_hasPerk( "specialty_falldamage" ) )
        {
            if ( var_2 > 0 )
                var_0 maps\mp\gametypes\_missions::processChallenge( "ch_falldamage" );

            var_8 = 0;
            var_2 = 0;
        }
    }
    else if ( var_3 == "MOD_MELEE" )
    {
        if ( isdefined( var_0.hasLightArmor ) && var_0.hasLightArmor )
        {
            if ( issubstr( var_4, "riotshield" ) )
                var_2 = int( var_0.maxHealth * 0.66 );
            else
                var_2 = var_0.maxHealth + 1;
        }

        if ( var_0 maps\mp\_utility::isJuggernaut() )
        {
            var_2 = 20;
            var_8 = 0;
        }
    }
    else if ( var_3 == "MOD_IMPACT" )
    {
        if ( var_0 maps\mp\_utility::isJuggernaut() )
        {
            switch ( var_4 )
            {
                case "concussion_grenade_mp":
                case "frag_grenade_mp":
                case "smoke_grenade_mp":
                case "flash_grenade_mp":
                case "semtex_mp":
                    var_2 = 5;
                    break;
                default:
                    if ( var_2 < 1000 )
                        var_2 = 25;

                    break;
            }

            var_8 = 0;
        }
    }

    if ( var_0 maps\mp\_utility::_hasPerk( "specialty_combathigh" ) )
    {
        if ( isdefined( self.damageBlockedTotal ) && ( !level.teamBased || isdefined( var_1 ) && isdefined( var_1.team ) && var_0.team != var_1.team ) )
        {
            var_9 = var_2 + var_8;
            var_10 = var_9 - var_9 / 3;
            self.damageBlockedTotal = self.damageBlockedTotal + var_10;

            if ( self.damageBlockedTotal >= 101 )
            {
                self notify( "combathigh_survived" );
                self.damageBlockedTotal = undefined;
            }
        }

        if ( var_4 != "throwingknife_mp" )
        {
            switch ( var_3 )
            {
                case "MOD_MELEE":
                case "MOD_FALLING":
                    break;
                default:
                    var_2 = int( var_2 / 3 );
                    var_8 = int( var_8 / 3 );
                    break;
            }
        }
    }

    if ( isdefined( var_0.hasLightArmor ) && var_0.hasLightArmor && var_4 == "throwingknife_mp" )
    {
        var_2 = var_0.health;
        var_8 = 0;
    }

    if ( var_2 <= 1 )
    {
        var_2 = 1;
        return var_2;
    }
    else
        return int( var_2 + var_8 );
}

initPerkDvars()
{
    level.bulletDamageMod = maps\mp\_utility::getIntProperty( "perk_bulletDamage", 40 ) / 100;
    level.armorVestMod = 0.08;
    level.armorVestDefMod = 0.08;
    level.armorPiercingMod = 1.5;
    level.explosiveDamageMod = maps\mp\_utility::getIntProperty( "perk_explosiveDamage", 40 ) / 100;
    level.blastShieldMod = maps\mp\_utility::getIntProperty( "perk_blastShield", 45 ) / 100;
    level.riotShieldMod = maps\mp\_utility::getIntProperty( "perk_riotShield", 100 ) / 100;
    level.dangerCloseMod = maps\mp\_utility::getIntProperty( "perk_dangerClose", 100 ) / 100;
}

cac_selector()
{
    var_0 = self.specialty;
}

gambitUseTracker()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    if ( getdvarint( "scr_game_perks" ) != 1 )
        return;

    maps\mp\_utility::gameFlagWait( "prematch_done" );
    self notifyonplayercommand( "gambit_on", "+frag" );
}

giveBlindEyeAfterSpawn()
{
    self endon( "death" );
    self endon( "disconnect" );
    maps\mp\_utility::givePerk( "specialty_blindeye", 0 );
    self.spawnperk = 1;

    while ( self.avoidKillstreakOnSpawnTimer > 0 )
    {
        self.avoidKillstreakOnSpawnTimer = self.avoidKillstreakOnSpawnTimer - 0.05;
        wait 0.05;
    }

    maps\mp\_utility::_unsetPerk( "specialty_blindeye" );
    self.spawnperk = 0;
}
