// IW5 PC GSC
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "mp_body_opforce_henchmen_sniper" );
    self attach( "head_opforce_henchmen_sniper", "", 1 );
    self.headModel = "head_opforce_henchmen_sniper";
    self setviewmodel( "viewhands_henchmen" );
    self.voice = "russian";
}

precache()
{
    precachemodel( "mp_body_opforce_henchmen_sniper" );
    precachemodel( "head_opforce_henchmen_sniper" );
    precachemodel( "viewhands_henchmen" );
}
