// IW5 PC GSC
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    init_lights();
}

init_lights()
{
    var_0 = getentarray( "sb_trash_fire_light_scripted", "targetname" );
    common_scripts\utility::array_thread( var_0, ::sb_trash_fire_light_scripted );
    var_1 = getentarray( "vista_ship_weld_light1_scripted", "targetname" );
    common_scripts\utility::array_thread( var_1, ::vista_ship_weld_light1_scripted );
    var_2 = getentarray( "vista_ship_weld_light2_scripted", "targetname" );
    common_scripts\utility::array_thread( var_2, ::vista_ship_weld_light2_scripted );
    var_3 = getentarray( "vista_ship_weld_light3_scripted", "targetname" );
    common_scripts\utility::array_thread( var_3, ::vista_ship_weld_light3_scripted );
    var_4 = getentarray( "sb_sparks_lookout_light_scripted", "targetname" );
    common_scripts\utility::array_thread( var_4, ::sb_sparks_lookout_light_scripted );
    var_5 = getentarray( "sb_meat_market_flickering", "targetname" );
    common_scripts\utility::array_thread( var_5, ::sb_meat_market_flickering );
}

sb_trash_fire_light_scripted()
{
    var_0 = self getlightintensity();
    var_1 = var_0;

    for (;;)
    {
        var_2 = randomfloatrange( var_0 * 0.3, var_0 * 1.2 );
        var_3 = randomfloatrange( 0.05, 0.1 );
        var_3 *= 15;

        for ( var_4 = 0; var_4 < var_3; var_4++ )
        {
            var_5 = var_2 * var_4 / var_3 + var_1 * ( var_3 - var_4 ) / var_3;
            self setlightintensity( var_5 );
            wait 0.05;
        }

        var_1 = var_2;
    }
}

vista_ship_weld_light1_scripted()
{
    var_0 = self getlightintensity();
    var_1 = var_0;

    for (;;)
    {
        var_2 = randomfloatrange( var_0 * 0, var_0 * 1.8 );
        var_3 = randomfloatrange( 0.05, 0.1 );
        var_3 *= 15;

        for ( var_4 = 0; var_4 < var_3; var_4++ )
        {
            var_5 = var_2 * var_4 / var_3 + var_1 * ( var_3 - var_4 ) / var_3;
            self setlightintensity( var_5 );
            wait 0.05;
        }

        var_1 = var_2;
    }
}

vista_ship_weld_light2_scripted()
{
    var_0 = self getlightintensity();
    var_1 = var_0;

    for (;;)
    {
        var_2 = randomfloatrange( var_0 * 0.01, var_0 * 1.9 );
        var_3 = randomfloatrange( 0.04, 0.2 );
        var_3 *= 15;

        for ( var_4 = 0; var_4 < var_3; var_4++ )
        {
            var_5 = var_2 * var_4 / var_3 + var_1 * ( var_3 - var_4 ) / var_3;
            self setlightintensity( var_5 );
            wait 0.05;
        }

        var_1 = var_2;
    }
}

vista_ship_weld_light3_scripted()
{
    var_0 = self getlightintensity();
    var_1 = var_0;

    for (;;)
    {
        var_2 = randomfloatrange( var_0 * 0, var_0 * 1.9 );
        var_3 = randomfloatrange( 0.03, 0.5 );
        var_3 *= 15;

        for ( var_4 = 0; var_4 < var_3; var_4++ )
        {
            var_5 = var_2 * var_4 / var_3 + var_1 * ( var_3 - var_4 ) / var_3;
            self setlightintensity( var_5 );
            wait 0.05;
        }

        var_1 = var_2;
    }
}

sb_sparks_lookout_light_scripted()
{
    var_0 = self getlightintensity();
    var_1 = var_0;

    for (;;)
    {
        var_2 = randomfloatrange( var_0 * 0.9, var_0 * 1.0 );
        var_3 = randomfloatrange( 0.2, 0.5 );
        var_3 *= 15;

        for ( var_4 = 0; var_4 < var_3; var_4++ )
        {
            var_5 = var_2 * var_4 / var_3 + var_1 * ( var_3 - var_4 ) / var_3;
            self setlightintensity( var_5 );
            wait 0.05;
        }

        var_1 = var_2;
    }
}

sb_restarteffect()
{
    common_scripts\_createfx::restart_fx_looper();
}

_ID4104( var_0 )
{
    return self._ID4104[var_0];
}

sb_ent_flag_clear( var_0 )
{
    if ( self._ID4104[var_0] )
    {
        self._ID4104[var_0] = 0;
        self notify( var_0 );
    }
}

sb_ent_flag_set( var_0 )
{
    self._ID4104[var_0] = 1;
    self notify( var_0 );
}

sb_ent_flag_init( var_0 )
{
    if ( !isdefined( self._ID4104 ) )
    {
        self._ID4104 = [];
        self._ID9703 = [];
    }

    self._ID4104[var_0] = 0;
}

sb_is_light_entity( var_0 )
{
    return var_0.classname == "light_spot" || var_0.classname == "light_omni" || var_0.classname == "light";
}

sb_meat_market_flickering()
{
    self endon( "stop_dynamic_light_behavior" );
    self._ID5702 = 0;
    self._ID5703 = undefined;
    self._ID5704 = undefined;
    self._ID5705 = 0;
    self._ID5706 = [];
    self._ID5707 = undefined;
    self._ID5708 = [];

    if ( isdefined( self.script_linkto ) )
    {
        self._ID5707 = common_scripts\utility::get_linked_ents();

        foreach ( var_1 in self._ID5707 )
        {
            if ( isdefined( var_1.script_noteworthy ) && var_1.script_noteworthy == "on" )
            {
                if ( !isdefined( self._ID5703 ) )
                    self._ID5703[0] = var_1;
                else
                    self._ID5703[self._ID5703.size] = var_1;

                continue;
            }

            if ( isdefined( var_1.script_noteworthy ) && var_1.script_noteworthy == "off" )
            {
                if ( !isdefined( self._ID5704 ) )
                    self._ID5704[0] = var_1;
                else
                    self._ID5704[self._ID5704.size] = var_1;

                self._ID5709 = var_1;
                continue;
            }

            if ( sb_is_light_entity( var_1 ) )
            {
                self._ID5705 = 1;
                self._ID5706[self._ID5706.size] = var_1;
            }
        }

        self._ID5702 = 1;
    }

    thread sb_generic_flicker_msg_watcher();
    thread sb_generic_flicker();
}

sb_generic_flicker_msg_watcher()
{
    sb_ent_flag_init( "flicker_on" );

    if ( isdefined( self._ID5713 ) && self._ID5713 != "nil" )
    {
        for (;;)
        {
            level waittill( self._ID5713 );
            sb_ent_flag_set( "flicker_on" );

            if ( isdefined( self._ID5714 ) && self._ID5714 != "nil" )
            {
                level waittill( self._ID5714 );
                sb_ent_flag_clear( "flicker_on" );
            }
        }
    }
    else
        sb_ent_flag_set( "flicker_on" );
}

sb_generic_flicker_pause()
{
    var_0 = self getlightintensity();

    if ( !_ID4104( "flicker_on" ) )
    {
        if ( self._ID5702 )
        {
            if ( isdefined( self._ID5703 ) )
            {
                foreach ( var_2 in self._ID5703 )
                {
                    var_2 hide();

                    if ( isdefined( var_2._ID5710 ) )
                        var_2._ID5710 common_scripts\utility::pauseEffect();
                }
            }

            if ( isdefined( self._ID5704 ) )
            {
                foreach ( var_5 in self._ID5704 )
                    var_5 show();
            }
        }

        self setlightintensity( 0 );

        if ( self._ID5705 )
        {
            for ( var_7 = 0; var_7 < self._ID5706.size; var_7++ )
                self._ID5706[var_7] setlightintensity( 0 );
        }

        self waittill( "flicker_on" );
        self setlightintensity( var_0 );

        if ( self._ID5705 )
        {
            for ( var_7 = 0; var_7 < self._ID5706.size; var_7++ )
                self._ID5706[var_7] setlightintensity( var_0 );
        }

        if ( self._ID5702 )
        {
            if ( isdefined( self._ID5703 ) )
            {
                foreach ( var_2 in self._ID5703 )
                {
                    var_2 show();

                    if ( isdefined( var_2._ID5710 ) )
                        var_2._ID5710 sb_restarteffect();
                }
            }

            if ( isdefined( self._ID5704 ) )
            {
                foreach ( var_5 in self._ID5704 )
                    var_5 hide();
            }
        }
    }
}

sb_generic_flicker()
{
    self endon( "stop_dynamic_light_behavior" );
    self endon( "death" );
    var_0 = 0.2;
    var_1 = 1.0;
    var_2 = self getlightintensity();
    var_3 = 0;
    var_4 = var_2;
    var_5 = 0;

    while ( isdefined( self ) )
    {
        sb_generic_flicker_pause();

        for ( var_5 = randomintrange( 1, 10 ); var_5; var_5-- )
        {
            sb_generic_flicker_pause();
            wait(randomfloatrange( 0.05, 0.1 ));

            if ( var_4 > 0.2 )
            {
                var_4 = randomfloatrange( 0, 0.3 );

                if ( self._ID5702 )
                {
                    foreach ( var_7 in self._ID5703 )
                    {
                        var_7 hide();

                        if ( isdefined( var_7._ID5710 ) )
                            var_7._ID5710 common_scripts\utility::pauseEffect();
                    }
                }

                if ( isdefined( self._ID5704 ) )
                {
                    foreach ( var_10 in self._ID5704 )
                        var_10 show();
                }
            }
            else
            {
                var_4 = var_2;

                if ( self._ID5702 )
                {
                    if ( isdefined( self._ID5703 ) )
                    {
                        foreach ( var_7 in self._ID5703 )
                        {
                            var_7 show();

                            if ( isdefined( var_7._ID5710 ) )
                                var_7._ID5710 sb_restarteffect();
                        }
                    }

                    if ( isdefined( self._ID5704 ) )
                    {
                        foreach ( var_10 in self._ID5704 )
                            var_10 hide();
                    }
                }
            }

            self setlightintensity( var_4 );

            if ( self._ID5705 )
            {
                for ( var_16 = 0; var_16 < self._ID5706.size; var_16++ )
                    self._ID5706[var_16] setlightintensity( var_4 );
            }
        }

        sb_generic_flicker_pause();
        self setlightintensity( var_2 );

        if ( self._ID5705 )
        {
            for ( var_16 = 0; var_16 < self._ID5706.size; var_16++ )
                self._ID5706[var_16] setlightintensity( var_2 );
        }

        if ( self._ID5702 )
        {
            if ( isdefined( self._ID5703 ) )
            {
                foreach ( var_7 in self._ID5703 )
                {
                    var_7 show();

                    if ( isdefined( var_7._ID5710 ) )
                        var_7._ID5710 sb_restarteffect();
                }
            }

            if ( isdefined( self._ID5704 ) )
            {
                foreach ( var_10 in self._ID5704 )
                    var_10 hide();
            }
        }

        wait(randomfloatrange( var_0, var_1 ));
    }
}
