// IW5 PC GSC
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "mp_body_russian_military_lmg_a_airborne" );
    self attach( "head_russian_military_bb", "", 1 );
    self.headModel = "head_russian_military_bb";
    self setviewmodel( "viewhands_russian_b" );
    self.voice = "russian";
}

precache()
{
    precachemodel( "mp_body_russian_military_lmg_a_airborne" );
    precachemodel( "head_russian_military_bb" );
    precachemodel( "viewhands_russian_b" );
}
