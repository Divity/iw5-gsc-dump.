// IW5 PC GSC
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "mp_body_gign_paris_lmg" );
    self attach( "head_gign_a", "", 1 );
    self.headModel = "head_gign_a";
    self setviewmodel( "viewhands_sas" );
    self.voice = "french";
}

precache()
{
    precachemodel( "mp_body_gign_paris_lmg" );
    precachemodel( "head_gign_a" );
    precachemodel( "viewhands_sas" );
}
