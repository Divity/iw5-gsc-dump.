// IW5 PC GSC
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "mp_body_russian_military_assault_a" );
    self attach( "head_russian_military_aa", "", 1 );
    self.headModel = "head_russian_military_aa";
    self setviewmodel( "viewhands_russian_a" );
    self.voice = "russian";
}

precache()
{
    precachemodel( "mp_body_russian_military_assault_a" );
    precachemodel( "head_russian_military_aa" );
    precachemodel( "viewhands_russian_a" );
}
