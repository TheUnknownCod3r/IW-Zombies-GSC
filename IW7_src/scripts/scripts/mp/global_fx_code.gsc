/*******************************************************************
 * Decompiled By: Bog
 * Decompiled File: scripts\mp\global_fx_code.gsc
 * Game: Call of Duty: Infinite Warfare
 * Platform: PC
 * Function Count: 1
 * Decompile Time: 67 ms
 * Timestamp: 10/27/2023 12:20:30 AM
*******************************************************************/

//Function Number: 1
global_fx(param_00,param_01,param_02,param_03,param_04)
{
	var_05 = scripts\engine\utility::getstructarray(param_00,"targetname");
	if(var_05.size <= 0)
	{
		return;
	}

	if(!isdefined(param_02))
	{
		param_02 = randomfloatrange(-20,-15);
	}

	if(!isdefined(param_03))
	{
		param_03 = param_01;
	}

	foreach(var_07 in var_05)
	{
		if(!isdefined(level._effect))
		{
			level._effect = [];
		}

		if(!isdefined(level._effect[param_03]))
		{
			level._effect[param_03] = loadfx(param_01);
		}

		if(!isdefined(var_07.angles))
		{
			var_07.angles = (0,0,0);
		}

		var_08 = scripts\engine\utility::createoneshoteffect(param_03);
		var_08.v["origin"] = var_07.origin;
		var_08.v["angles"] = var_07.angles;
		var_08.v["fxid"] = param_03;
		var_08.v["delay"] = param_02;
		if(isdefined(param_04))
		{
			var_08.v["soundalias"] = param_04;
		}
	}
}