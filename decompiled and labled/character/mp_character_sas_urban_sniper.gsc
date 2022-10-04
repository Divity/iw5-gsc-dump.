// IW5 PC GSC
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self setmodel( "mp_body_ally_sas_sniper" );
    self attach( "head_ally_sas_sniper", "", 1 );
    self.headModel = "head_ally_sas_sniper";
    self setviewmodel( "viewhands_sas" );
    self.voice = "british";
}

precache()
{
    precachemodel( "mp_body_ally_sas_sniper" );
    precachemodel( "head_ally_sas_sniper" );
    precachemodel( "viewhands_sas" );
}
