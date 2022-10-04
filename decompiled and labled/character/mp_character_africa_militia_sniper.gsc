// IW5 PC GSC
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "mp_body_opforce_africa_militia_sniper" );
    self attach( "head_opforce_africa_sniper", "", 1 );
    self.headModel = "head_opforce_africa_sniper";
    self setviewmodel( "viewhands_african_militia" );
    self.voice = "african";
}

precache()
{
    precachemodel( "mp_body_opforce_africa_militia_sniper" );
    precachemodel( "head_opforce_africa_sniper" );
    precachemodel( "viewhands_african_militia" );
}
