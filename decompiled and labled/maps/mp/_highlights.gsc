// IW5 PC GSC
// Decompiled by https://github.com/xensik/gsc-tool

giveHighlight( var_0, var_1 )
{
    var_2 = getclientmatchdata( "highlightCount" );

    if ( var_2 < 18 )
    {
        setclientmatchdata( "highlights", var_2, "award", var_0 );
        setclientmatchdata( "highlights", var_2, "clientId", self.clientMatchDataId );
        setclientmatchdata( "highlights", var_2, "value", var_1 );
        var_2++;
        setclientmatchdata( "highlightCount", var_2 );
    }
}
