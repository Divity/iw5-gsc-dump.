// IW5 PC GSC
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "mp_body_africa_militia_assault_a" );
    codescripts\character::attachHead( "alias_africa_militia_heads_mp", xmodelalias\alias_africa_militia_heads_mp::main() );
    self setviewmodel( "viewhands_african_militia" );
    self.voice = "african";
}

precache()
{
    precachemodel( "mp_body_africa_militia_assault_a" );
    codescripts\character::precacheModelArray( xmodelalias\alias_africa_militia_heads_mp::main() );
    precachemodel( "viewhands_african_militia" );
}
