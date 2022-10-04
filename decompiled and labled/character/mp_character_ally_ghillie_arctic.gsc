// IW5 PC GSC
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "mp_body_ally_ghillie_desert_sniper" );
    self attach( "head_ally_arctic_sniper", "", 1 );
    self.headModel = "head_ally_arctic_sniper";
    self setviewmodel( "viewhands_iw5_ghillie_arctic" );
    self.voice = "delta";
}

precache()
{
    precachemodel( "mp_body_ally_ghillie_desert_sniper" );
    precachemodel( "head_ally_arctic_sniper" );
    precachemodel( "viewhands_iw5_ghillie_arctic" );
}
