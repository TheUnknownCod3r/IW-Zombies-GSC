// IW7 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

main()
{
    if ( isdefined( level._id_CBD2 ) )
        return;

    level._id_CBD2 = 1;
    var_0 = getentarray( "pipe_shootable", "targetname" );

    if ( !var_0.size )
        return;

    level._id_1367 = spawnstruct();
    level._id_1367._id_C1FD = 0;
    var_0 thread _id_D80E();
    var_0 thread _id_B6A0();
    thread _id_D6D7( var_0 );
}

_id_D6D7( var_0 )
{
    waittillframeend;

    if ( level.createfx_enabled )
        return;

    scripts\engine\utility::_id_22D2( var_0, ::_id_CBD4 );
}

_id_CBD4()
{
    self setcandamage( 1 );
    self _meth_82B8( 0 );
    self._id_CBCD = [];
    var_0 = undefined;

    if ( isdefined( self._id_0334 ) )
    {
        var_0 = scripts\engine\utility::_id_817E( self._id_0334, "targetname" );
        self._id_1491 = var_0.origin;
        var_1 = anglestoforward( var_0.angles );
        var_1 = var_1 * 128;
        self._id_26FF = self._id_1491 + var_1;
    }
    else
    {
        var_1 = anglestoforward( self.angles );
        var_2 = var_1 * 64;
        self._id_1491 = self.origin + var_2;
        var_2 = var_1 * -64;
        self._id_26FF = self.origin + var_2;
    }

    thread _id_CBCF();
}

_id_CBCF()
{
    var_0 = ( 0, 0, 0 );
    var_1 = 0;
    var_2 = 4;

    for (;;)
    {
        self waittill( "damage", var_3, var_4, var_5, var_0, var_6 );

        if ( var_1 )
        {
            if ( randomint( 100 ) <= 33 )
                continue;
        }

        var_1 = 1;
        var_7 = _id_CBCE( var_5, var_0, var_6, var_4 );

        if ( var_7 )
            var_2--;

        if ( var_2 <= 0 )
            break;
    }

    self setcandamage( 0 );
}

_id_CBCE( var_0, var_1, var_2, var_3 )
{
    if ( level._id_1367._id_C1FD > 12 )
        return 0;

    if ( !isdefined( level._id_1367._id_1366[var_2] ) )
        var_1 = _id_CBCA( var_1, var_2 );
    else
        var_1 = self [[ level._id_1367._id_1366[var_2] ]]( var_1, var_2 );

    if ( !isdefined( var_1 ) )
        return 0;

    if ( isdefined( var_3.classname ) && var_3.classname == "worldspawn" )
        return 0;

    foreach ( var_5 in self._id_CBCD )
    {
        if ( distancesquared( var_1, var_5.origin ) < 25 )
            return 0;
    }

    var_7 = undefined;

    if ( isai( var_3 ) )
        var_7 = var_3 geteye();
    else
        var_7 = var_3.origin;

    var_8 = var_1 - var_7;
    var_9 = bullettrace( var_7, var_7 + 1.5 * var_8, 0, var_3, 0 );

    if ( isdefined( var_9["normal"] ) && isdefined( var_9["entity"] ) && var_9["entity"] == self )
    {
        var_10 = var_9["normal"];
        thread _id_CBD0( var_1, var_10, var_3 );
        return 1;
    }

    return 0;
}

_id_CBD0( var_0, var_1, var_2 )
{
    var_3 = level._id_1367._id_760B[self.script_noteworthy];
    var_4 = level._id_1367._id_1365[self.script_noteworthy];
    var_5 = int( var_4 / var_3 );
    var_6 = 30;
    var_7 = "mtl_steam_pipe_hit";
    var_8 = "mtl_steam_pipe_hiss_loop";
    var_9 = "mtl_steam_pipe_hiss_loop_end";
    var_10 = spawn( "script_origin", var_0 );
    var_10 hide();
    var_10 playsound( var_7 );
    var_10 playloopsound( var_8 );
    self._id_CBCD[self._id_CBCD.size] = var_10;

    if ( scripts\engine\utility::_id_9F64() || self.script_noteworthy != "steam" )
        thread _id_CBCC( var_0, var_1, var_2, var_10 );

    if ( self.script_noteworthy == "oil_leak" )
    {
        var_11 = spawn( "script_model", var_0 );
        var_11 setmodel( "tag_origin" );
        var_11.angles = vectortoangles( var_1 );
        playfxontag( level._id_1367._effect[self.script_noteworthy], var_11, "tag_origin" );
        level._id_1367._id_C1FD++;
        var_11 _meth_826C( 90, var_3, 1, 1 );
        wait( var_3 );
        stopfxontag( level._id_1367._effect[self.script_noteworthy], var_11, "tag_origin" );
        var_5--;
    }
    else
    {
        playfx( level._id_1367._effect[self.script_noteworthy], var_0, var_1 );
        level._id_1367._id_C1FD++;
        wait( var_3 );
        var_5--;
    }

    while ( level._id_1367._id_C1FD <= 12 && var_5 > 0 )
    {
        if ( self.script_noteworthy == "oil_leak" )
        {
            var_11 = spawn( "script_model", var_0 );
            var_11 setmodel( "tag_origin" );
            var_11.angles = vectortoangles( var_1 );
            playfxontag( level._id_1367._effect[self.script_noteworthy], var_11, "tag_origin" );
            level._id_1367._id_C1FD++;
            var_11 _meth_826C( 90, var_3, 1, 1 );
            wait( var_3 );
            stopfxontag( level._id_1367._effect[self.script_noteworthy], var_11, "tag_origin" );
            continue;
        }

        playfx( level._id_1367._effect[self.script_noteworthy], var_0, var_1 );
        wait( var_3 );
        var_5--;
    }

    var_10 playsound( var_9 );
    wait 0.5;
    var_10 stoploopsound( var_8 );
    var_10 delete();
    self._id_CBCD = scripts\engine\utility::_id_22BC( self._id_CBCD );
    level._id_1367._id_C1FD--;
}

_id_CBCC( var_0, var_1, var_2, var_3 )
{
    if ( !_id_1C5A() )
        return;

    var_3 endon( "death" );
    var_4 = var_3.origin + vectornormalize( var_1 ) * 40;
    var_5 = level._id_1367._id_11E4[self.script_noteworthy];

    for (;;)
    {
        if ( !isdefined( self._id_4D5C ) )
            self _meth_8253( var_4, 36, var_5, var_5 * 0.75, undefined, "MOD_TRIGGER_HURT" );
        else
            self _meth_8253( var_4, 36, var_5, var_5 * 0.75, var_2, "MOD_TRIGGER_HURT" );

        wait 0.4;
    }
}

_id_1C5A()
{
    if ( !scripts\engine\utility::_id_9F64() )
        return 0;

    if ( !isdefined( level._id_CBD3 ) )
        return 1;

    return level._id_CBD3;
}

_id_B6A0()
{
    level._id_1367._id_1366 = [];
    level._id_1367._id_1366["MOD_UNKNOWN"] = ::_id_CBCB;
    level._id_1367._id_1366["MOD_PISTOL_BULLET"] = ::_id_CBC9;
    level._id_1367._id_1366["MOD_RIFLE_BULLET"] = ::_id_CBC9;
    level._id_1367._id_1366["MOD_GRENADE"] = ::_id_CBCB;
    level._id_1367._id_1366["MOD_GRENADE_SPLASH"] = ::_id_CBCB;
    level._id_1367._id_1366["MOD_PROJECTILE"] = ::_id_CBCB;
    level._id_1367._id_1366["MOD_PROJECTILE_SPLASH"] = ::_id_CBCB;
    level._id_1367._id_1366["MOD_TRIGGER_HURT"] = ::_id_CBCB;
    level._id_1367._id_1366["MOD_EXPLOSIVE"] = ::_id_CBCB;
    level._id_1367._id_1366["MOD_EXPLOSIVE_BULLET"] = ::_id_CBCB;
}

_id_CBC9( var_0, var_1 )
{
    return var_0;
}

_id_CBCB( var_0, var_1 )
{
    var_2 = vectornormalize( vectorfromlinetopoint( self._id_1491, self._id_26FF, var_0 ) );
    var_0 = pointonsegmentnearesttopoint( self._id_1491, self._id_26FF, var_0 );
    return var_0 + var_2 * 4;
}

_id_CBCA( var_0, var_1 )
{
    return undefined;
}

_id_D80E()
{
    var_0 = 0;
    var_1 = 0;
    var_2 = 0;
    var_3 = 0;
    var_4 = 0;

    foreach ( var_6 in self )
    {
        if ( var_6.script_noteworthy == "water" )
            var_6.script_noteworthy = "steam";

        if ( var_6.script_noteworthy == "steam" )
        {
            var_6 willneverchange();
            var_0 = 1;
            continue;
        }

        if ( var_6.script_noteworthy == "fire" )
        {
            var_6 willneverchange();
            var_1 = 1;
            continue;
        }

        if ( var_6.script_noteworthy == "steam_small" )
        {
            var_6 willneverchange();
            var_2 = 1;
            continue;
        }

        if ( var_6.script_noteworthy == "oil_leak" )
        {
            var_6 willneverchange();
            var_3 = 1;
            continue;
        }

        if ( var_6.script_noteworthy == "oil_cap" )
        {
            var_6 willneverchange();
            var_4 = 1;
            continue;
        }
    }

    if ( var_0 )
    {
        level._id_1367._effect["steam"] = loadfx( "vfx/core/impacts/pipe_steam" );
        level._id_1367._id_1408["steam_hit"] = "mtl_steam_pipe_hit";
        level._id_1367._id_1408["steam_loop"] = "mtl_steam_pipe_hiss_loop";
        level._id_1367._id_1408["steam_end"] = "mtl_steam_pipe_hiss_loop_end";
        level._id_1367._id_760B["steam"] = 3;
        level._id_1367._id_11E4["steam"] = 5;
        level._id_1367._id_1365["steam"] = 25;
    }

    if ( var_2 )
    {
        level._id_1367._effect["steam_small"] = loadfx( "vfx/core/impacts/pipe_steam_small" );
        level._id_1367._id_1408["steam_small_hit"] = "mtl_steam_pipe_hit";
        level._id_1367._id_1408["steam_small_loop"] = "mtl_steam_pipe_hiss_loop";
        level._id_1367._id_1408["steam_small_end"] = "mtl_steam_pipe_hiss_loop_end";
        level._id_1367._id_760B["steam_small"] = 3;
        level._id_1367._id_11E4["steam_small"] = 5;
        level._id_1367._id_1365["steam_small"] = 25;
    }

    if ( var_1 )
    {
        level._id_1367._effect["fire"] = loadfx( "vfx/core/impacts/pipe_fire" );
        level._id_1367._id_1408["fire_hit"] = "mtl_gas_pipe_hit";
        level._id_1367._id_1408["fire_loop"] = "mtl_gas_pipe_flame_loop";
        level._id_1367._id_1408["fire_end"] = "mtl_gas_pipe_flame_end";
        level._id_1367._id_760B["fire"] = 3;
        level._id_1367._id_11E4["fire"] = 5;
        level._id_1367._id_1365["fire"] = 25;
    }

    if ( var_3 )
    {
        level._id_1367._effect["oil_leak"] = loadfx( "vfx/core/impacts/pipe_oil_barrel_spill" );
        level._id_1367._id_1408["oil_leak_hit"] = "mtl_oil_barrel_hit";
        level._id_1367._id_1408["oil_leak_loop"] = "mtl_oil_barrel_hiss_loop";
        level._id_1367._id_1408["oil_leak_end"] = "mtl_oil_barrel_hiss_loop_end";
        level._id_1367._id_760B["oil_leak"] = 6;
        level._id_1367._id_1365["oil_leak"] = 6;
        level._id_1367._id_11E4["oil_leak"] = 5;
    }

    if ( var_4 )
    {
        level._id_1367._effect["oil_cap"] = loadfx( "vfx/core/impacts/pipe_oil_barrel_squirt" );
        level._id_1367._id_1408["oil_cap_hit"] = "mtl_steam_pipe_hit";
        level._id_1367._id_1408["oil_cap_loop"] = "mtl_steam_pipe_hiss_loop";
        level._id_1367._id_1408["oil_cap_end"] = "mtl_steam_pipe_hiss_loop_end";
        level._id_1367._id_760B["oil_cap"] = 3;
        level._id_1367._id_11E4["oil_cap"] = 5;
        level._id_1367._id_1365["oil_cap"] = 5;
    }
}