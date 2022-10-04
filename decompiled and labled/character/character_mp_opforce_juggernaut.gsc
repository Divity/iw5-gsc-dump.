// IW5 PC GSC
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "mp_fullbody_opforce_juggernaut" );
    self setviewmodel( "viewhands_juggernaut_opforce" );
    self.voice = "russian";
}

precache()
{
    precachemodel( "mp_fullbody_opforce_juggernaut" );
    precachemodel( "viewhands_juggernaut_opforce" );
}
