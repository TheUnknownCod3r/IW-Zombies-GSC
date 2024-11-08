/*******************************************************************
 * Decompiled By: Bog
 * Decompiled File: 2582.gsc
 * Game: Call of Duty: Infinite Warfare
 * Platform: PC
 * Function Count: 10
 * Decompile Time: 3 ms
 * Timestamp: 10/27/2023 12:23:24 AM
*******************************************************************/

//Function Number: 1
func_98D2()
{
	self.bt.var_EB89 = spawnstruct();
	self.bt.var_EB89.var_BF75 = gettime() + 500;
	self.bt.var_EB89.var_BFB3["engage"] = gettime() + 1000;
	self.bt.var_EB89.enabled = 1;
	self.bt.var_EB89.var_D895 = undefined;
	self.bt.var_EB89.var_3D4C = [];
	if(self.unittype == "c12")
	{
		self.bt.var_EB89.var_71CE = ::func_360A;
	}

	if(isdefined(level.var_10E5D))
	{
		return;
	}

	level.var_10E5F["c12"] = 300;
	level.var_10E5E["c12"] = 500;
}

//Function Number: 2
func_360A(param_00)
{
	switch(param_00.type)
	{
		case "seek":
			param_00.alias = "vox_c12_seeking";
			param_00.priority = 0.2;
			break;

		case "targeting":
			param_00.alias = "vox_c12_targetting";
			param_00.priority = 1;
			break;

		case "newenemy":
			param_00.alias = "vox_c12_threatdetected";
			param_00.priority = 0.75;
			break;

		case "engage":
			param_00.alias = "vox_c12_engaging";
			param_00.priority = 0.5;
			break;
	}
}

//Function Number: 3
func_12F2C(param_00)
{
	if(isdefined(self.bt.var_F1F8) && self.bt.var_F1F8)
	{
		return level.failure;
	}

	if(gettime() < self.bt.var_EB89.var_BF75)
	{
		return level.failure;
	}

	updateenemy();
	if(func_D53D())
	{
		self.bt.var_EB89.var_BF75 = gettime() + randomfloatrange(level.var_10E5F[self.unittype],level.var_10E5E[self.unittype]);
	}

	return level.failure;
}

//Function Number: 4
updateenemy()
{
	if(isdefined(self.isnodeoccupied))
	{
		if(!isdefined(self.bt.var_EB89.var_D895) || self.bt.var_EB89.var_D895 != self.isnodeoccupied)
		{
			func_17BA("newenemy",self.isnodeoccupied);
		}
		else if(gettime() > self.bt.var_EB89.var_BFB3["engage"])
		{
			self.bt.var_EB89.var_BFB3["engage"] = gettime() + randomfloatrange(1000,3000);
			func_17BA("engage",self.isnodeoccupied);
		}

		self.bt.var_EB89.var_D895 = self.isnodeoccupied;
	}
}

//Function Number: 5
_meth_81C5(param_00)
{
	var_01 = [];
	foreach(var_03 in param_00)
	{
		if(!func_9FA6(var_03))
		{
			continue;
		}

		var_01[var_01.size] = var_03;
	}

	return sortbydistance(var_01,level.player.origin);
}

//Function Number: 6
func_9FA6(param_00)
{
	if(distancesquared(level.player.origin,param_00.origin) > 6250000)
	{
		return 0;
	}

	if(scripts\engine\utility::within_fov(level.player.origin,level.player.angles,param_00.origin,0))
	{
		return 0;
	}

	return 1;
}

//Function Number: 7
func_D53D()
{
	if(!isalive(self))
	{
		return 0;
	}

	if(!scripts\anim\battlechatter::func_29CA())
	{
		return 0;
	}

	if(isdefined(self.var_9F6B) && self.var_9F6B)
	{
		return 0;
	}

	if(!self.bt.var_EB89.enabled)
	{
		return 0;
	}

	if(level.isteamspeaking[self.team])
	{
		return 0;
	}

	var_00 = func_7EFD();
	if(!isdefined(var_00))
	{
		return 0;
	}

	thread func_D53E(var_00);
	return 1;
}

//Function Number: 8
func_7EFD()
{
	var_00 = -1;
	var_01 = undefined;
	foreach(var_03 in self.bt.var_EB89.var_3D4C)
	{
		if(var_03.priority > var_00)
		{
			var_01 = var_03;
			var_00 = var_03.priority;
		}
	}

	return var_01;
}

//Function Number: 9
func_17BA(param_00,param_01,param_02)
{
	var_03 = spawnstruct();
	var_03.alias = undefined;
	var_03.type = param_00;
	[[ self.bt.var_EB89.var_71CE ]](var_03);
	if(!isdefined(var_03.alias))
	{
		return undefined;
	}

	if(isdefined(param_01))
	{
		var_03.var_117B9 = param_01;
	}

	if(!isdefined(var_03.priority))
	{
		var_03.priority = 0;
	}

	if(!isdefined(self.var_3D4C))
	{
		self.bt.var_EB89.var_3D4C = [];
	}

	self.bt.var_EB89.var_3D4C[param_00] = var_03;
}

//Function Number: 10
func_D53E(param_00)
{
	self endon("death");
	if(scripts\anim\battlechatter::battlechatter_canprint())
	{
	}

	self.bt.var_EB89.var_3D4C[param_00.type] = undefined;
	self.var_9F6B = 1;
	self getyawtoenemy(param_00.alias,param_00.alias,1);
	self waittill(param_00.alias);
	self.var_9F6B = 0;
}