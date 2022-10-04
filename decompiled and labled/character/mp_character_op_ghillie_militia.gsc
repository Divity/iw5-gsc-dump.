// IW5 PC GSC
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "mp_body_opforce_ghillie_africa_militia_sniper" );
    self attach( "head_ghillie_africa_militia_sniper", "", 1 );
    self.headModel = "head_ghillie_africa_militia_sniper";
    self setviewmodel( "viewhands_african_militia" );
    self.voice = "russian";
}

precache()
{
    precachemodel( "mp_body_opforce_ghillie_africa_militia_sniper" );
    precachemodel( "head_ghillie_africa_militia_sniper" );
    precachemodel( "viewhands_african_militia" );
}
