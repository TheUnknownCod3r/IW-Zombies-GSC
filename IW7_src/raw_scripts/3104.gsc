// IW7 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_7598( var_0 )
{
    if ( !isdefined( self._id_7542 ) )
        self._id_7542 = spawnstruct();

    _id_0B91::_id_75CE();

    if ( isdefined( var_0 ) && var_0 )
        thread _id_13D7D();
}

_id_13D7D()
{
    self endon( "entitydeleted" );
    wait 0.05;
    _id_0BDC::_id_A19F();
}

_id_A3B4( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = self._id_02A9;

    _id_A3B7( var_0 );
}

_id_A3B7( var_0, var_1 )
{
    if ( !level._id_241D )
    {
        if ( var_0 == "hover" )
            var_0 = "hover_space";
        else if ( var_0 == "fly" )
            var_0 = "fly_space";
    }

    if ( !isdefined( self ) || !isalive( self ) )
        return;

    if ( isdefined( self._id_615D ) && self._id_615D._id_619D )
        return;

    if ( isdefined( self._id_7542._id_10E19 ) && self._id_7542._id_10E19 == var_0 )
        return;

    self notify( "notify_change_fx_state" );
    self endon( "notify_change_fx_state" );
    self endon( "entitydeleted" );

    if ( isdefined( var_1 ) )
        wait( var_1 );

    if ( isdefined( self._id_7542._id_552E ) )
        self thread [[ self._id_7542._id_552E ]]();

    self._id_7542._id_552E = undefined;

    switch ( var_0 )
    {
        case "hover":
            _id_2399();
            break;
        case "hover_space":
            _id_23A9();
            break;
        case "fly":
            _id_11132();
            break;
        case "fly_space":
            _id_11143();
            break;
        case "fly_glide":
            _id_11136();
            break;
        case "hover_glide":
            _id_239F();
            break;
        case "reentry":
            _id_239F();
            break;
        case "launch_mode":
            _id_AA78();
            break;
        case "boost_mode":
            _id_2CAF();
            break;
        case "landed_mode":
            _id_A7CC();
            break;
        case "none":
            break;
    }

    self._id_7542._id_10E19 = var_0;
}

_id_23A9()
{
    foreach ( var_1 in level._id_A1E3[self._id_EEDE + "_rear_thrusters"] )
        _id_0B91::_id_75C4( self._id_EEDE + "_rearThrustIdle_space", var_1, 0, "notify_change_fx_state" );

    self._id_7542._id_552E = ::_id_23A8;
}

_id_23A8()
{
    foreach ( var_1 in level._id_A1E3[self._id_EEDE + "_rear_thrusters"] )
        _id_0B91::_id_75F8( self._id_EEDE + "_rearThrustIdle_space", var_1 );
}

_id_2399()
{
    foreach ( var_1 in level._id_A1E3[self._id_EEDE + "_rear_thrusters"] )
        _id_0B91::_id_75C4( self._id_EEDE + "_rearThrustIdle", var_1, 0, "notify_change_fx_state" );

    _id_0B91::_id_75C4( self._id_EEDE + "_vtolThrustCenter", "tag_vtol_center", 0, "notify_change_fx_state" );
    _id_0B91::_id_75C4( self._id_EEDE + "_vtolThrustSide", "tag_vtol_left", 0, "notify_change_fx_state" );
    _id_0B91::_id_75C4( self._id_EEDE + "_vtolThrustSide", "tag_vtol_right", 0, "notify_change_fx_state" );
    _id_13913();
    self._id_7542._id_552E = ::_id_2398;
}

_id_2398()
{
    foreach ( var_1 in level._id_A1E3[self._id_EEDE + "_rear_thrusters"] )
        _id_0B91::_id_75F8( self._id_EEDE + "_rearThrustIdle", var_1 );

    _id_0B91::_id_75F8( self._id_EEDE + "_vtolThrustCenter", "tag_vtol_center" );
    _id_0B91::_id_75F8( self._id_EEDE + "_vtolThrustSide", "tag_vtol_left" );
    _id_0B91::_id_75F8( self._id_EEDE + "_vtolThrustSide", "tag_vtol_right" );
    _id_13912();
}

_id_5B7D()
{
    self endon( "entitydeleted" );
    var_0 = 3;

    while ( var_0 > 0 )
    {
        var_0 = var_0 - 0.05;
        wait 0.05;
    }
}

_id_13913()
{
    thread _id_0B96::_id_1A93();
}

_id_13912()
{
    self notify( "stop_kicking_up_dust" );
}

_id_11132()
{
    foreach ( var_1 in level._id_A1E3[self._id_EEDE + "_rear_thrusters"] )
        _id_0B91::_id_75C4( self._id_EEDE + "_rearThrustMax", var_1, 0, "notify_change_fx_state" );

    self._id_7542._id_552E = ::_id_11131;
}

_id_11131()
{
    foreach ( var_1 in level._id_A1E3[self._id_EEDE + "_rear_thrusters"] )
        _id_0B91::_id_75F8( self._id_EEDE + "_rearThrustMax", var_1 );
}

_id_11143()
{
    foreach ( var_1 in level._id_A1E3[self._id_EEDE + "_rear_thrusters"] )
        _id_0B91::_id_75C4( self._id_EEDE + "_rearThrustMax_space", var_1, 0, "notify_change_fx_state" );

    self._id_7542._id_552E = ::_id_11142;
}

_id_11142()
{
    foreach ( var_1 in level._id_A1E3[self._id_EEDE + "_rear_thrusters"] )
        _id_0B91::_id_75F8( self._id_EEDE + "_rearThrustMax_space", var_1 );
}

_id_11136()
{
    self._id_7542._id_552E = ::_id_11135;
}

_id_11135()
{

}

_id_239F()
{
    foreach ( var_1 in level._id_A1E3[self._id_EEDE + "_rear_thrusters"] )
        _id_0B91::_id_75C4( self._id_EEDE + "_rearThrustIdle", var_1, 0, "notify_change_fx_state" );

    self._id_7542._id_552E = ::_id_239E;
}

_id_239E()
{
    foreach ( var_1 in level._id_A1E3[self._id_EEDE + "_rear_thrusters"] )
        _id_0B91::_id_75F8( self._id_EEDE + "_rearThrustIdle", var_1 );
}

_id_AA78()
{
    foreach ( var_1 in level._id_A1E3[self._id_EEDE + "_launch_boosters_med"] )
        _id_0B91::_id_75C4( self._id_EEDE + "_rearThrustLaunch_med", var_1, 0, "notify_change_fx_state" );

    foreach ( var_1 in level._id_A1E3[self._id_EEDE + "_launch_boosters_lrg"] )
        _id_0B91::_id_75C4( self._id_EEDE + "_rearThrustLaunch_lrg", var_1, 0, "notify_change_fx_state" );

    self._id_7542._id_552E = ::_id_AA77;
}

_id_AA77()
{
    foreach ( var_1 in level._id_A1E3[self._id_EEDE + "_launch_boosters_med"] )
        _id_0B91::_id_75A0( self._id_EEDE + "_rearThrustLaunch_med", var_1 );

    foreach ( var_1 in level._id_A1E3[self._id_EEDE + "_launch_boosters_lrg"] )
        _id_0B91::_id_75A0( self._id_EEDE + "_rearThrustLaunch_lrg", var_1 );
}

_id_AA79()
{
    foreach ( var_1 in level._id_A1E3[self._id_EEDE + "_launch_boosters_med"] )
        _id_0B91::_id_75A0( self._id_EEDE + "_rearThrustLaunch_med", var_1, 0, "notify_change_fx_state" );

    foreach ( var_1 in level._id_A1E3[self._id_EEDE + "_launch_boosters_lrg"] )
        _id_0B91::_id_75A0( self._id_EEDE + "_rearThrustLaunch_lrg", var_1, 0, "notify_change_fx_state" );
}

_id_2CAF()
{
    foreach ( var_1 in level._id_A1E3[self._id_EEDE + "_rear_thrusters"] )
        _id_0B91::_id_75C4( self._id_EEDE + "_rearThrustBoost", var_1, 0, "notify_change_fx_state" );

    self._id_7542._id_552E = ::_id_2CAE;
}

_id_2CAE()
{
    foreach ( var_1 in level._id_A1E3[self._id_EEDE + "_rear_thrusters"] )
        _id_0B91::_id_75F8( self._id_EEDE + "_rearThrustBoost", var_1 );
}

_id_A7CC()
{
    self._id_7542._id_552E = ::_id_A7CB;
}

_id_A7CB()
{

}

_id_AA92()
{
    foreach ( var_1 in level._id_A1E3[self._id_EEDE + "_launch_boosters_med"] )
        playfx( scripts\engine\utility::_id_7ECB( self._id_EEDE + "_rearThrustLaunch_panels_blow_med" ), self gettagorigin( var_1 ), anglestoforward( self gettagangles( var_1 ) ), anglestoup( self gettagangles( var_1 ) ) );
}

_id_AA91()
{
    foreach ( var_1 in level._id_A1E3[self._id_EEDE + "_launch_boosters_lrg"] )
        playfx( scripts\engine\utility::_id_7ECB( self._id_EEDE + "_rearThrustLaunch_panels_blow_med" ), self gettagorigin( var_1 ), anglestoforward( self gettagangles( var_1 ) ), anglestoup( self gettagangles( var_1 ) ) );
}

_id_AA67( var_0 )
{
    var_1 = "stop_launch_charge_med";
    self notify( var_1 );

    if ( !isdefined( var_0 ) )
        var_0 = 1;

    if ( var_0 )
    {
        foreach ( var_3 in level._id_A1E3[self._id_EEDE + "_launch_boosters_med"] )
            _id_0B91::_id_75C4( self._id_EEDE + "_rearThrustLaunch_charge_lrg", var_3, 0, var_1 );
    }
    else
    {
        foreach ( var_3 in level._id_A1E3[self._id_EEDE + "_launch_boosters_med"] )
            _id_0B91::_id_75A0( self._id_EEDE + "_rearThrustLaunch_charge_lrg", var_3 );
    }
}

_id_AA66( var_0 )
{
    var_1 = "stop_launch_charge_lrg";
    self notify( var_1 );

    if ( !isdefined( var_0 ) )
        var_0 = 1;

    if ( var_0 )
    {
        foreach ( var_3 in level._id_A1E3[self._id_EEDE + "_launch_boosters_lrg"] )
            _id_0B91::_id_75C4( self._id_EEDE + "_rearThrustLaunch_charge_lrg", var_3, 0, var_1 );
    }
    else
    {
        foreach ( var_3 in level._id_A1E3[self._id_EEDE + "_launch_boosters_lrg"] )
            _id_0B91::_id_75A0( self._id_EEDE + "_rearThrustLaunch_charge_lrg", var_3 );
    }
}
