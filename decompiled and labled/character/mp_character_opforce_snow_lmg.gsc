// IW5 PC GSC
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "mp_body_russian_military_lmg_a_arctic" );
    codescripts\character::attachHead( "alias_russian_military_arctic_heads", xmodelalias\alias_russian_military_arctic_heads::main() );
    self setviewmodel( "viewhands_russian_d" );
    self.voice = "russian";
}

precache()
{
    precachemodel( "mp_body_russian_military_lmg_a_arctic" );
    codescripts\character::precacheModelArray( xmodelalias\alias_russian_military_arctic_heads::main() );
    precachemodel( "viewhands_russian_d" );
}
