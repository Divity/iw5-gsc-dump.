// IW5 PC GSC
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "mp_body_ally_ghillie_woodland_sniper" );
    self attach( "head_ally_delta_sniper", "", 1 );
    self.headModel = "head_ally_delta_sniper";
    self setviewmodel( "viewhands_iw5_ghillie_woodland" );
    self.voice = "pmc";
}

precache()
{
    precachemodel( "mp_body_ally_ghillie_woodland_sniper" );
    precachemodel( "head_ally_delta_sniper" );
    precachemodel( "viewhands_iw5_ghillie_woodland" );
}
