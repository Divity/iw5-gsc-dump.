// IW5 PC GSC
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "mp_body_opforce_ghillie_arctic_sniper" );
    self attach( "head_opforce_russian_arctic_sniper", "", 1 );
    self.headModel = "head_opforce_russian_arctic_sniper";
    self setviewmodel( "viewhands_iw5_ghillie_arctic" );
    self.voice = "russian";
}

precache()
{
    precachemodel( "mp_body_opforce_ghillie_arctic_sniper" );
    precachemodel( "head_opforce_russian_arctic_sniper" );
    precachemodel( "viewhands_iw5_ghillie_arctic" );
}
