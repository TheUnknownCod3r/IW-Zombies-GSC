// IW7 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_D7F8()
{
    precacherumble( "steady_rumble" );
    precacheshader( "overlay_static" );
    precacheshader( "hud_jackal_overlay_damage" );
    precacheshader( "hud_iw7_warning" );
    precacheshader( "hud_iw7_incoming" );
    precacheshader( "heli_warning_missile_red" );
    precacheshader( "ac130_hud_friendly_vehicle_diamond_s_w" );
    precacheshader( "reticle_center_cook" );
    precacheshader( "hud_offscreenobjectivepointer" );
    _func_17C();
}

_id_F901()
{
    level._id_12A71 = undefined;
    level._id_12A70 = undefined;
    level._id_12A6D = undefined;
    level._id_12A96 = undefined;
    level._id_B8B5 = 1;
    level._id_C07D = 1;
    level._id_A427 = undefined;
    level._id_11937 = 0.05;
    level._id_A3BE = 1;
    level.player _id_0BB6::_id_B7EA();
}

_id_F902()
{
    scripts\engine\utility::_id_6E39( "event_turrets_down" );
    scripts\engine\utility::_id_6E39( "event_capitalship_down" );
    scripts\engine\utility::_id_6E39( "capital_ship_spawned" );
    scripts\engine\utility::_id_6E39( "jackalObjectiveDead" );
    scripts\engine\utility::_id_6E39( "player_in_jackal" );
    scripts\engine\utility::_id_6E39( "hide_hull" );
    scripts\engine\utility::_id_6E39( "show_hull" );
}

_id_A122( var_0, var_1, var_2 )
{
    var_3 = _id_0BDC::_id_1079F( var_1, var_0 );
    level._id_D127 = var_3;
    _id_0BDC::_id_10CD1( var_3, var_0, var_2 );
    wait 0.1;
    _id_0BD6::_id_621A();
    thread _id_0BD5::_id_88DB();
}

_id_F900( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 0;

    var_3 = getent( var_0, "targetname" );
    var_3._id_ED5D = 0;

    if ( isdefined( var_1 ) )
        var_3._id_EEF9 = var_1;
    else
    {
        switch ( var_3._id_01F1 )
        {
            case "veh_mil_air_ca_carrier_sa_rig":
            case "veh_mil_air_ca_carrier_sa":
            case "veh_mil_air_ca_cruiser":
                var_3._id_EEF9 = "cannon_small_ca cannon_flak_ca";
                break;
            case "veh_mil_air_ca_destroyer":
            default:
                var_3._id_EEF9 = "cannon_small_ca,1,1,amb_turret_sml_l_ts_1,amb_turret_sml_l_ts_5,amb_turret_sml_r_ts_1,amb_turret_sml_r_ts_5,amb_turret_sml_m_3,amb_turret_sml_m_4,amb_turret_sml_r_b_1,amb_turret_sml_l_b_1 cannon_flak_ca cannon_missile_ca cannon_large_lock_ca,1,1,amb_turret_sml_m_2,amb_turret_sml_m_1";
                break;
        }
    }

    if ( !isdefined( level._id_3965 ) )
    {
        var_4 = _id_0B93::_id_1080E( var_0 );
        level._id_3965 = var_4[0];
    }

    level._id_3965 _id_0B93::_id_8441();
    level._id_3965._id_ED5D = 0;

    if ( !var_2 )
        level._id_3965._id_12FBA = 1;

    thread _id_119C9();
    scripts\engine\utility::_id_6E3E( "capital_ship_spawned" );
}

_id_119C9()
{
    level._id_3965 endon( "death" );
    thread _id_119CA();

    for (;;)
    {
        level._id_3965 waittill( "hide_hull" );
        level._id_3965 hide();
        level._id_3965 notsolid();
        level._id_3965 _id_0BB8::_id_39CD( "off" );
        level._id_3965 _id_0BB8::_id_39D0( "off" );
        level._id_3965 _id_0BB8::_id_39CE( "off" );
        level._id_3965 waittill( "show_hull" );
        level._id_3965 show();
        level._id_3965 solid();
        level._id_3965 _id_0BB8::_id_39CD( "idle" );
        level._id_3965 _id_0BB8::_id_39D0( "idle" );
        level._id_3965 _id_0BB8::_id_39CE( "high" );
    }
}

_id_119CA()
{
    level._id_3965 endon( "death" );

    for (;;)
    {
        scripts\engine\utility::_id_6E4C( "hide_hull" );
        level._id_3965 notify( "hide_hull" );
        scripts\engine\utility::_id_6E2A( "hide_hull" );
        scripts\engine\utility::_id_6E4C( "show_hull" );
        level._id_3965 notify( "show_hull" );
        scripts\engine\utility::_id_6E2A( "show_hull" );
    }
}

_id_88BD( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    if ( !isdefined( var_8 ) )
        var_8 = 0;

    if ( isdefined( var_0 ) )
    {
        for ( var_9 = 0; var_9 < var_1; var_9++ )
            var_0 waittill( "turret_destroyed" );
    }

    scripts\engine\utility::_id_6E3E( "event_turrets_down" );
    var_10 = getent( var_2, "targetname" );

    if ( isdefined( var_5 ) && var_5 )
    {
        if ( isdefined( var_10 ) && isdefined( var_10._id_EE79 ) )
            var_10._id_EE79 = var_10._id_EE79 + "doNotCountTurrets 1";
        else
            var_10._id_EE79 = "doNotCountTurrets 1";
    }

    if ( isdefined( var_6 ) )
        var_10._id_EEF9 = var_6;
    else
    {
        switch ( var_10._id_01F1 )
        {
            case "veh_mil_air_ca_cruiser":
                var_10._id_EEF9 = "";
                break;
            case "veh_mil_air_ca_frigate":
                var_10._id_EEF9 = "cannon_small_ca,1,1 cannon_flak_ca,1,1";
                break;
            case "veh_mil_air_ca_destroyer":
            default:
                var_10._id_EEF9 = "cannon_small_ca,1,2,amb_turret_sml_l_ts_1,amb_turret_sml_l_ts_5,amb_turret_sml_r_ts_1,amb_turret_sml_r_ts_5,amb_turret_sml_m_3,amb_turret_sml_m_4,amb_turret_sml_r_b_1,amb_turret_sml_l_b_1 cannon_flak_ca,1,2";
                break;
        }
    }

    if ( scripts\engine\utility::_id_9CEE( var_7 ) )
        var_11 = _id_0B93::_id_1080C( var_2 );
    else
        var_11 = _id_0BB8::_id_398E( var_2, "idle", "heavy", "high" );

    level notify( "event_capitalship_ftl_in", var_11 );

    if ( !var_8 )
        var_11._id_12FBA = 1;

    if ( isdefined( var_3 ) )
    {
        var_12 = getvehiclenode( var_3, "targetname" );
        var_11 _id_0B93::_id_2471( var_12 );
    }

    wait 0.1;
    var_11 thread _id_0BB6::_id_39F0( undefined, undefined, 1 );

    for ( var_9 = 0; var_9 < var_4; var_9++ )
        var_11 waittill( "turret_destroyed" );

    scripts\engine\utility::_id_6E3E( "event_capitalship_down" );
    level notify( "event_capitalship_ftl_out" );
    var_11 _id_0BB8::_id_3991();
    var_11 delete();
}

_id_88BE( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    if ( !isdefined( var_9 ) )
        var_9 = 0;

    if ( isdefined( var_0 ) )
    {
        for ( var_10 = 0; var_10 < var_1; var_10++ )
            var_0 waittill( "turret_destroyed" );
    }

    scripts\engine\utility::_id_6E3E( "event_turrets_down" );
    var_11 = getent( var_2, "targetname" );

    if ( isdefined( var_5 ) && var_5 )
    {
        if ( isdefined( var_11 ) && isdefined( var_11._id_EE79 ) )
            var_11._id_EE79 = var_11._id_EE79 + "doNotCountTurrets 1";
        else
            var_11._id_EE79 = "doNotCountTurrets 1";
    }

    if ( isdefined( var_6 ) )
        var_11._id_EEF9 = var_6;
    else
    {
        switch ( var_11._id_01F1 )
        {
            case "veh_mil_air_ca_cruiser":
                var_11._id_EEF9 = "";
                break;
            case "veh_mil_air_ca_frigate":
                var_11._id_EEF9 = "cannon_small_ca,1,1 cannon_flak_ca,1,1";
                break;
            case "veh_mil_air_ca_destroyer":
            default:
                var_11._id_EEF9 = "cannon_small_ca,1,2,amb_turret_sml_l_ts_1,amb_turret_sml_l_ts_5,amb_turret_sml_r_ts_1,amb_turret_sml_r_ts_5,amb_turret_sml_m_3,amb_turret_sml_m_4,amb_turret_sml_r_b_1,amb_turret_sml_l_b_1 cannon_flak_ca,1,2";
                break;
        }
    }

    if ( scripts\engine\utility::_id_9CEE( var_7 ) )
        var_12 = _id_0B93::_id_1080C( var_2 );
    else
        var_12 = _id_0BB8::_id_398E( var_2, "idle", "heavy", "high" );

    if ( !var_9 )
        var_12._id_12FBA = 1;

    level notify( "event_capitalship_ftl_in", var_12 );

    if ( isdefined( var_3 ) )
    {
        var_13 = getvehiclenode( var_3, "targetname" );
        var_12 _id_0B93::_id_2471( var_13 );
    }

    wait 0.1;

    if ( !isdefined( var_8 ) )
        var_12 thread _id_0BB6::_id_39F0( undefined, undefined, 1 );

    return var_12;
}

_id_88D0( var_0, var_1 )
{
    playfx( scripts\engine\utility::_id_7ECB( "destroyer_explode" ), var_0.origin );

    if ( isdefined( var_1 ) && var_1 == 1 )
        var_0 delete();
}

_id_C28F()
{
    var_0 = scripts\engine\utility::_id_107E6();
    var_1 = "tag_origin";
    var_0 linkto( self, var_1, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    _func_20B( var_0, ( 0, 0, 60 ) );
    _func_211( var_0, 100, 0 );
    _func_210( var_0, 100 );

    for (;;)
    {
        if ( !isalive( self ) || !isdefined( self ) )
            break;

        _func_214( var_0, "jackal_objective1" );
        _func_212( var_0, "jackal_objective1" );
        wait 0.1;
    }

    var_0 delete();
}

_id_FA4E( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = var_0 gettagorigin( var_2 );
    var_7 = var_0 gettagangles( var_2 );
    var_8 = spawn( "script_model", var_6 );
    var_8.angles = var_7;
    var_8._id_AD42 = var_2;
    var_8._id_C841 = self;
    var_8.health = var_4;
    var_8.team = "axis";
    var_8._id_EEDE = "axis";
    var_8 setcandamage( 1 );
    var_8 _meth_80C7();
    var_8 _id_0BDC::_id_105DB( "turret" );
    var_8 setmodel( var_1 );
    var_8 linkto( var_0, var_2, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    var_8._id_4D1E = spawnstruct();
    var_8._id_4D1E._id_7542 = spawnstruct();
    var_8._id_4D1E._id_7542._id_1037F = "capital_turret_smolder_lg";
    var_8._id_4D1E._id_7542._id_4CD9 = "capital_turret_damage1_lg";
    var_8._id_4D1E._id_7542._id_4CDA = "capital_turret_damage2_lg";
    var_8._id_4D1E._id_7542._id_00E6 = "capital_turret_death_lg";

    if ( isdefined( var_3 ) )
    {
        switch ( var_3 )
        {
            case "ALL":
                var_8 thread _id_0BB6::_id_129DD();
                var_8 thread _id_613D( var_5 );
                break;
            case "EMP":
                var_8 thread _id_613D( var_5 );
                break;
            default:
                var_8 thread _id_0BB6::_id_129DD();
        }
    }
    else
        var_8 thread _id_0BB6::_id_129DD();

    var_8 _id_0B91::_id_F40A( "enemy", 0 );
}

_id_613D( var_0 )
{
    self endon( "terminate_ai_threads" );
    self endon( "death" );
    self endon( "entitydeleted" );

    if ( !isdefined( level._id_10951 ) )
        level._id_10951 = [];

    level._id_10951[level._id_10951.size] = self;
    self waittill( "emp", var_1, var_2, var_3 );
    self._id_4B43 = var_3;
    scripts\engine\utility::_id_6E3E( var_0 );
    self _meth_818B();
}

_id_B2DB( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    if ( isdefined( var_8 ) )
        level endon( var_8 );

    _id_F9B7();
    self._id_FE2D = [];

    for ( var_9 = 0; var_9 <= var_3; var_9++ )
    {
        if ( var_9 > var_2 )
            _id_13796( self._id_FE2D, self._id_FE2D.size );

        var_10 = _id_EF53( var_0 + _id_0B91::_id_11145( var_9 ), var_1 + _id_0B91::_id_11145( var_9 ) );

        if ( !isdefined( var_10 ) )
            continue;

        scripts\engine\utility::waitframe();

        if ( !isdefined( var_7 ) || var_7 == 0 )
            thread _id_EF54( var_10 );

        _id_8927( var_10, var_5, var_6 );
        self._id_FE2D = scripts\engine\utility::_id_2279( self._id_FE2D, var_10 );
    }

    if ( isdefined( var_4 ) )
        level notify( var_4 );
}

_id_EF53( var_0, var_1, var_2, var_3 )
{
    var_4 = getent( var_0, "targetname" );

    if ( !isdefined( var_4 ) )
        return;

    var_5 = var_4 _id_0B91::_id_10808();
    var_5 _id_0BDC::_id_19A0( 1 );

    if ( scripts\engine\utility::_id_6E34( "jackal_wait_launch" ) )
    {
        scripts\engine\utility::_id_6E4C( "jackal_wait_launch" );
        wait( randomfloat( 0.25 ) );
    }

    var_5 thread _id_0BDC::_id_A1EF( _id_0B91::_id_7C9A( var_1 ) );
    return var_5;
}

_id_EF54( var_0 )
{
    var_0 waittill( "end_spline" );
    var_0 _id_0BDC::_id_19A0( 0 );
}

_id_EF55( var_0, var_1 )
{
    var_0 waittill( "end_spline" );
    var_2 = _id_0B91::_id_7C9A( var_1 );
    var_0 thread _id_0BDC::_id_A1EF( var_2 );
}

_id_B2D9( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( isdefined( var_6 ) )
        level endon( var_6 );

    _id_F9B7();
    self._id_FE2D = [];
    var_7 = getentarray( var_0, "targetname" );
    var_8 = 0;

    if ( !isdefined( level._id_C072 ) )
        level._id_C072 = 0;

    while ( var_8 != var_1 )
    {
        foreach ( var_10 in var_7 )
        {
            scripts\engine\utility::waitframe();

            if ( var_8 >= var_1 )
                break;

            var_10 _id_0B91::_id_1747( _id_0BDC::_id_19AB, 250 );
            var_11 = var_10 _id_0B91::_id_10808();
            scripts\engine\utility::waitframe();
            _id_8927( var_11, var_4, var_5 );
            self._id_FE2D = scripts\engine\utility::_id_2279( self._id_FE2D, var_11 );
            var_8++;
        }
    }

    if ( var_2 == -1 )
        var_8 = -2;

    while ( var_2 < 0 || var_8 < var_2 && self._id_FE2D.size > 0 )
    {
        self._id_FE2D = scripts\engine\utility::_id_22BC( self._id_FE2D );

        if ( isdefined( level._id_B74A ) )
            _id_13796( self._id_FE2D, level._id_B74A );
        else
            _id_13796( self._id_FE2D, self._id_FE2D.size );

        self._id_FE2D = scripts\engine\utility::_id_22BC( self._id_FE2D );

        if ( self._id_FE2D.size < var_1 && var_8 < var_2 )
        {
            foreach ( var_10 in var_7 )
            {
                var_10 _id_0B91::_id_1747( _id_0BDC::_id_19AB, 250 );
                var_11 = var_10 _id_0B91::_id_10808();

                if ( var_2 != -1 )
                    var_8++;

                _id_8927( var_11, var_4, var_5 );
                self._id_FE2D = scripts\engine\utility::_id_2279( self._id_FE2D, var_11 );
                scripts\engine\utility::waitframe();
            }
        }

        wait 1;
    }

    if ( isdefined( var_3 ) )
        level notify( var_3 );
}

_id_8927( var_0, var_1, var_2 )
{
    if ( isdefined( var_1 ) )
    {
        var_3 = _func_2CA( "path_starts" );

        if ( isdefined( var_3 ) && isdefined( var_3.size ) && var_3.size > 0 )
            var_0 _id_0BDC::_id_19B3( "patrol", "path_starts" );
    }
    else
    {
        var_3 = _func_2CA( "path_starts" );

        if ( isdefined( var_3 ) && isdefined( var_3.size ) && var_3.size > 0 )
            var_0 _id_0BDC::_id_19B3( "patrol", "path_starts" );
    }

    if ( isdefined( level._id_A427 ) && level._id_A427 )
        thread _id_A290( var_0 );

    if ( isdefined( level._id_A3BE ) && level._id_A3BE )
        var_0 thread _id_A2D0( var_0 );

    var_0 setthreatbiasgroup( "jackals" );

    if ( isdefined( var_2 ) )
    {
        if ( level._id_C072 >= var_2 )
            var_0 _id_0BDC::_id_19B1( 0 );
        else
        {
            level._id_C072++;

            if ( isdefined( level._id_C07D ) && level._id_C07D )
                thread _id_A290( var_0 );
        }
    }
}

_id_A2D0( var_0 )
{
    var_1 = scripts\engine\utility::_id_8180( "jackal_targets", "targetname" );
    var_0 thread _id_A13D();
    var_0 thread _id_A1C0( var_1 );
    var_0 thread _id_A1C3( var_1 );
}

_id_A13D()
{
    self endon( "stop_firing_turrets_scripted" );
    self endon( "death" );
    self endon( "entitydeleted" );

    for (;;)
    {
        self waittill( "start_death" );

        if ( !( level.player _id_0B91::_id_65DF( "player_inside_ship" ) && level.player _id_0B91::_id_65DB( "player_inside_ship" ) ) )
        {
            var_0 = 4;

            if ( isdefined( self._id_EE79 ) && float( self._id_EE79 ) > 0 )
                var_0 = ceil( float( self._id_EE79 ) );

            if ( var_0 == 1 )
                _id_0B91::_id_54C6();
            else
            {
                var_1 = randomintrange( 1, var_0 );

                if ( var_1 == 1 )
                    _id_0B91::_id_54C6();
            }
        }
    }
}

_id_A1C0( var_0 )
{
    self endon( "stop_firing_turrets_scripted" );
    self endon( "death" );
    self endon( "entitydeleted" );

    if ( !isdefined( level._id_B898 ) )
    {
        level._id_B898 = 0;
        level._id_B8AD = [];
    }

    for (;;)
    {
        self waittill( "start_missiles" );
        var_1 = gettime();
        var_2 = randomfloatrange( 1, 3 );

        while ( gettime() - var_1 <= var_2 )
        {
            if ( !( level.player _id_0B91::_id_65DF( "player_inside_ship" ) && level.player _id_0B91::_id_65DB( "player_inside_ship" ) ) )
            {
                var_3 = _id_A365( var_0, 1 );
                _id_A1BD( var_3, "missile" );
            }

            wait 0.1;
        }
    }
}

_id_A1C3( var_0 )
{
    self endon( "stop_firing_turrets_scripted" );
    self endon( "death" );
    self endon( "entitydeleted" );

    for (;;)
    {
        self waittill( "start_strafe" );
        var_1 = gettime();
        var_2 = randomfloatrange( 1, 3 );

        while ( gettime() - var_1 <= var_2 )
        {
            if ( !( level.player _id_0B91::_id_65DF( "player_inside_ship" ) && level.player _id_0B91::_id_65DB( "player_inside_ship" ) ) )
            {
                var_3 = _id_A365( var_0 );
                _id_A1BD( var_3, "bullet" );
            }

            wait 0.1;
        }
    }
}

_id_A365( var_0, var_1 )
{
    if ( isdefined( var_1 ) && var_1 == 1 )
    {
        var_2 = randomint( var_0.size );
        var_3 = var_0[var_2] scripts\engine\utility::_id_107E6();
    }
    else
    {
        var_0 = sortbydistance( var_0, self.origin );

        if ( scripts\engine\utility::_id_4347() )
            var_3 = var_0[0] scripts\engine\utility::_id_107E6();
        else
            var_3 = var_0[1] scripts\engine\utility::_id_107E6();
    }

    thread _id_A35F( var_3 );
    return var_3;
}

_id_A35F( var_0 )
{
    wait 8;
    var_0 delete();
}

_id_A1BD( var_0, var_1 )
{
    var_2 = self gettagorigin( self._id_284C[self._id_284B] ) + ( 0, 0, 100 );
    var_3 = self gettagangles( self._id_284C[self._id_284B] );
    var_4 = var_0.origin;
    self._id_6D1D = "cap_turret_proj_missile_barrage";

    if ( isdefined( var_1 ) && var_1 == "missile" )
    {
        self._id_114FB = var_0;
        scripts\engine\utility::waitframe();
        thread _id_0BB6::_id_6D51( var_2, var_3, self._id_284C[self._id_284B], 1 );
        wait 0.1;
        self._id_284B = ( self._id_284B + 1 ) % self._id_284C.size;
        var_2 = self gettagorigin( self._id_284C[self._id_284B] ) + ( 0, 0, 100 );
        var_3 = self gettagangles( self._id_284C[self._id_284B] );
        thread _id_0BB6::_id_6D51( var_2, var_3, self._id_284C[self._id_284B], 1 );
    }
    else
        magicbullet( "magic_spaceship_30mm_projectile_fake", var_2, var_4 + ( 0, 0, randomfloatrange( -100, 100 ) ) );

    self._id_284B = ( self._id_284B + 1 ) % self._id_284C.size;
}

_id_890D()
{
    if ( !isdefined( level._id_26EB ) )
        return;

    if ( !isdefined( level._id_26EB._id_FE2D ) )
        return;

    foreach ( var_1 in level._id_26EB._id_FE2D )
    {
        if ( isdefined( var_1 ) && _func_209( var_1 ) )
        {
            var_1 _meth_8558();
            var_1 _meth_84C1();
            _func_206( var_1, level.player );
        }
    }
}

_id_890C()
{
    if ( !isdefined( level._id_1D0A ) )
        return;

    if ( !isdefined( level._id_1D0A._id_FE2D ) )
        return;

    foreach ( var_1 in level._id_1D0A._id_FE2D )
    {
        if ( isdefined( var_1 ) && _func_209( var_1 ) )
            _func_206( var_1, level.player );
    }
}

_id_8968()
{
    if ( !isdefined( level._id_1D0A ) )
        return;

    if ( !isdefined( level._id_1D0A._id_FE2D ) )
        return;

    foreach ( var_1 in level._id_1D0A._id_FE2D )
    {
        if ( isdefined( var_1 ) && _func_209( var_1 ) )
            _func_215( var_1, level.player );
    }
}

_id_11AAB()
{
    self waittill( "death" );
    level._id_C072--;
}

_id_E20A( var_0 )
{
    if ( isdefined( var_0 ) )
    {
        level._id_C072 = level._id_C072 - int( var_0 );

        if ( level._id_C072 < 0 )
            level._id_C072 = 0;
    }
    else
        level._id_C072 = 0;
}

_id_13796( var_0, var_1, var_2 )
{
    var_10 = spawnstruct();

    if ( isdefined( var_2 ) )
    {
        var_10 endon( "thread_timed_out" );
        var_10 thread _id_0B92::_id_13758( var_2 );
    }

    var_10._id_00C1 = var_0.size;

    if ( isdefined( var_1 ) && var_1 < var_10._id_00C1 )
        var_10._id_00C1 = var_1;

    scripts\engine\utility::_id_22D2( var_0, _id_0B92::_id_13757, var_10 );

    while ( var_10._id_00C1 > 0 )
        var_10 waittill( "waittill_dead guy died" );
}

_id_F3ED( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        var_2._id_0180 = 1;
        var_2 _id_0BDC::_id_19B1( 0 );
    }
}

_id_A290( var_0 )
{
    if ( !isdefined( _id_0B91::_id_C264( "OBJ_KILL_JACKALS" ) ) )
    {
        _id_963D();
        scripts\engine\utility::waitframe();
    }

    var_0 thread _id_F436();
}

_id_963D()
{
    _func_14E( _id_0B91::_id_C264( "OBJ_KILL_JACKALS" ), "current", "Kill the jackals" );
}

_id_F436()
{
    if ( !isdefined( level._id_A40E ) )
        level._id_A40E = 0;

    var_0 = level._id_A40E;
    _func_150( _id_0B91::_id_C264( "OBJ_KILL_JACKALS" ), var_0, self, ( 0, 0, 60 ) );
    level._id_A40E++;
    thread _id_F437( var_0 );
    scripts\engine\utility::waittill_any( "death", "remove_objective_marker" );
    level notify( "key_jackal_death" );
    _func_151( _id_0B91::_id_C264( "OBJ_KILL_JACKALS" ), var_0, ( 0, 0, 0 ) );
}

_id_F437( var_0 )
{
    level waittill( "ship_infil_triggered" );
    _func_151( _id_0B91::_id_C264( "OBJ_KILL_JACKALS" ), var_0, ( 0, 0, 0 ) );
}

_id_13795()
{
    _func_161( _id_0B91::_id_C264( "OBJ_KILL_JACKALS" ), "KILL" );

    while ( level._id_A40E > 0 )
    {
        level waittill( "key_jackal_death" );
        level._id_A40E--;
        scripts\engine\utility::waitframe();
    }

    scripts\engine\utility::_id_6E3E( "jackalObjectiveDead" );
    _id_0B91::_id_C27C( _id_0B91::_id_C264( "OBJ_KILL_JACKALS" ) );
}

_id_F43B( var_0, var_1 )
{
    if ( !isdefined( self ) )
        return;

    var_2 = scripts\engine\utility::_id_107E6();

    if ( !isdefined( var_0 ) )
        var_0 = ( 0, 0, 350 );

    if ( _id_0B91::_id_8C32( self._id_01F1, "j_mainroot" ) )
        var_3 = "j_mainroot";
    else if ( _id_0B91::_id_8C32( self._id_01F1, "j_mainroot_ship" ) )
        var_3 = "j_mainroot_ship";
    else
        var_3 = "tag_origin";

    var_2 linkto( self, var_3, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    _func_20B( var_2, var_0 );
    thread _id_A294( var_2 );
    thread _id_A292( var_2, var_1 );
    _func_211( var_2, 100, 0 );
    _func_210( var_2, 100 );
    scripts\engine\utility::waittill_any( "death", "entiydeleted", "remove_objective_marker" );
    _func_20A( var_2 );
    var_2 delete();
}

_id_A294( var_0 )
{
    self endon( "entitydeleted" );
    self endon( "death" );
    self endon( "remove_objective_marker" );

    for (;;)
    {
        if ( isdefined( self._id_AF28 ) )
        {
            if ( self._id_AF28._id_AF21 || self._id_AF28._id_AEED )
                _func_214( var_0, "ac130_hud_target_flash" );
            else
                _func_214( var_0, "veh_jackal_target" );
        }
        else
            _func_214( var_0, "veh_jackal_target" );

        wait 0.15;
    }
}

_id_A292( var_0, var_1 )
{
    self endon( "entitydeleted" );
    self endon( "death" );
    self endon( "remove_objective_marker" );
    var_2 = "veh_jackal_target";

    if ( isdefined( var_1 ) )
        var_2 = var_1;

    for (;;)
    {
        _func_212( var_0, var_2 );
        wait 0.2;
        _func_212( var_0, "ac130_hud_target_flash" );
        wait 0.1;
    }
}

_id_E04A()
{
    if ( isdefined( self ) )
        self notify( "remove_objective_marker" );
}

_id_F9B7()
{
    createthreatbiasgroup( "jackals" );
    setignoremegroup( "allies", "jackals" );
    setignoremegroup( "axis", "jackals" );
    setignoremegroup( "jackals", "allies" );
    setignoremegroup( "jackals", "axis" );
}
