// IW5 PC GSC
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "mp_body_henchmen_assault_c" );
    codescripts\character::attachHead( "alias_henchmen_heads_mp", xmodelalias\alias_henchmen_heads_mp::main() );
    self setviewmodel( "viewhands_henchmen" );
    self.voice = "russian";
}

precache()
{
    precachemodel( "mp_body_henchmen_assault_c" );
    codescripts\character::precacheModelArray( xmodelalias\alias_henchmen_heads_mp::main() );
    precachemodel( "viewhands_henchmen" );
}
