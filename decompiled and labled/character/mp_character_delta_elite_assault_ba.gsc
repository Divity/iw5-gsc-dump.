// IW5 PC GSC
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "mp_body_delta_elite_assault_ba" );
    codescripts\character::attachHead( "alias_delta_elite_heads", xmodelalias\alias_delta_elite_heads::main() );
    self setviewmodel( "viewhands_delta" );
    self.voice = "delta";
}

precache()
{
    precachemodel( "mp_body_delta_elite_assault_ba" );
    codescripts\character::precacheModelArray( xmodelalias\alias_delta_elite_heads::main() );
    precachemodel( "viewhands_delta" );
}
