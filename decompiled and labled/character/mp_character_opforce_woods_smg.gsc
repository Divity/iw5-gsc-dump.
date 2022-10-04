// IW5 PC GSC
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "mp_body_russian_military_smg_a_woodland" );
    self attach( "head_russian_military_e", "", 1 );
    self.headModel = "head_russian_military_e";
    self setviewmodel( "viewhands_russian_c" );
    self.voice = "russian";
}

precache()
{
    precachemodel( "mp_body_russian_military_smg_a_woodland" );
    precachemodel( "head_russian_military_e" );
    precachemodel( "viewhands_russian_c" );
}
