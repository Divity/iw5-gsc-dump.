// IW5 PC GSC
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    level thread onPlayerConnect();
    level thread onPlayerDisconnect();
}

onPlayerConnect()
{
    for (;;)
    {
        level waittill( "connected",  var_0  );
        var_0.connectTime = gettime();
        var_0.targets = [];
        var_0 thread onWeaponFired();
        var_0 thread onDeath();
    }
}

onPlayerDisconnect()
{
    for (;;)
    {
        level waittill( "disconnected",  var_0  );
        var_0.targets = [];
    }
}

onWeaponFired()
{
    level endon( "game_ended" );
    self endon( "disconnected" );

    for (;;)
        self waittill( "weapon_fired" );
}

onDeath()
{
    level endon( "game_ended" );
    self endon( "disconnected" );

    for (;;)
        self waittill( "death" );
}

processKill( var_0, var_1 )
{
    updateskill( var_0, var_1, "war", 1.0 );
}
