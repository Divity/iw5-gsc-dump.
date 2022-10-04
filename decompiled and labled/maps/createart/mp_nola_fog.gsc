// IW5 PC GSC
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    var_0 = maps\_utility::create_vision_set_fog( "mp_nola" );
    var_0.startdist = 168.45;
    var_0.halfwaydist = 5503.32;
    var_0.red = 0.681;
    var_0.green = 0.684;
    var_0.blue = 0.687;
    var_0.maxopacity = 0.2875;
    var_0.transitionTime = 0;
    var_0.sunFogEnabled = 1;
    var_0._ID6896 = 0.826;
    var_0._ID6897 = 0.763;
    var_0._ID6898 = 0.696;
    var_0._ID6899 = ( -0.046, -0.78, 0.622 );
    var_0._ID6900 = 0;
    var_0._ID6901 = 115.8;
    var_0._ID6902 = 1.0;
    var_0 = maps\_utility::create_vision_set_fog( "mp_nola_indoor" );
    var_0.startdist = 300;
    var_0.halfwaydist = 7971;
    var_0.red = 0.681;
    var_0.green = 0.684;
    var_0.blue = 0.687;
    var_0.maxopacity = 0.2;
    var_0.transitionTime = 0;
    var_0.sunFogEnabled = 1;
    var_0._ID6896 = 0.826;
    var_0._ID6897 = 0.763;
    var_0._ID6898 = 0.696;
    var_0._ID6899 = ( -0.046, -0.78, 0.622 );
    var_0._ID6900 = 0;
    var_0._ID6901 = 105.8;
    var_0._ID6902 = 1.0;
    var_0 = maps\_utility::create_vision_set_fog( "mp_nola_church" );
    var_0.startdist = 300;
    var_0.halfwaydist = 7971;
    var_0.red = 0.681;
    var_0.green = 0.684;
    var_0.blue = 0.687;
    var_0.maxopacity = 0.2;
    var_0.transitionTime = 0;
    var_0.sunFogEnabled = 1;
    var_0._ID6896 = 0.826;
    var_0._ID6897 = 0.763;
    var_0._ID6898 = 0.696;
    var_0._ID6899 = ( -0.046, -0.78, 0.622 );
    var_0._ID6900 = 0;
    var_0._ID6901 = 105.8;
    var_0._ID6902 = 1.0;
    maps\_utility::vision_set_fog_changes( "mp_nola", 0 );
}
