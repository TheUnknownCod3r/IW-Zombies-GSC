/*******************************************************************
 * Decompiled By: Bog
 * Decompiled File: scripts\anim\combat.gsc
 * Game: Call of Duty: Infinite Warfare
 * Platform: PC
 * Function Count: 71
 * Decompile Time: 3478 ms
 * Timestamp: 10\27\2023 12:00:11 AM
*******************************************************************/

//Function Number: 1
func_9504()
{
}

//Function Number: 2
main()
{
	if(isdefined(self.var_BFDC))
	{
		return;
	}

	if(isdefined(self.var_4C37))
	{
		if(isdefined(self.var_4C37["combat"]))
		{
			[[ self.var_4C37["combat"] ]]();
			return;
		}
	}

	self endon("killanimscript");
	if(getdvarint("ai_iw7",0) == 1)
	{
		wait(0.05);
	}

	[[ self.exception["exposed"] ]]();
	scripts\anim\utility::func_9832("combat");
	self.var_1491.var_22F5 = undefined;
	if(isdefined(self.target_getindexoftarget) && self.var_205.type == "Ambush" && self getweaponassetfromrootweapon(self.target_getindexoftarget))
	{
		self.var_1E2C = self.target_getindexoftarget;
	}

	transitiontocombat();
	func_5859();
	if(isdefined(self.var_1095A))
	{
		scripts\anim\stop::func_1095B();
	}

	func_F8A3();
	func_6A13();
	self notify("stop_deciding_how_to_shoot");
}

//Function Number: 3
end_script()
{
	if(getdvarint("ai_iw7",0) == 1)
	{
		return;
	}

	self.var_1E2C = undefined;
	func_43D0();
}

//Function Number: 4
func_5859()
{
	if(self.team != "allies")
	{
		return;
	}

	if(self _meth_81B1() && self.weaponstartammo == "move" && self.var_1491.pose == "stand" && !isdefined(self.var_55EF))
	{
		if(isdefined(self.isnodeoccupied) && distancesquared(self.origin,self.var_10C.origin) < squared(128))
		{
			return;
		}

		if(!isdefined(self.var_1491.var_2274))
		{
			return;
		}

		if(isdefined(self.var_1491.var_2274["surprise_stop"]))
		{
			var_00 = scripts\anim\utility::func_1F64("surprise_stop");
		}
		else
		{
			var_00 = scripts\anim\utility::func_B027("combat","surprise_stop");
		}

		func_E246();
		self _meth_82E4("react",var_00,%root,1,0.2,self.animplaybackrate);
		func_43E3(var_00,"run");
		scripts\anim\shared::donotetracks("react");
	}
}

//Function Number: 5
transitiontocombat()
{
	if(isdefined(self.var_1095A) || isdefined(self.var_4C8C))
	{
		return;
	}

	if(isdefined(self.isnodeoccupied) && distancesquared(self.origin,self.var_10C.origin) < 262144)
	{
		return;
	}

	if(self.weaponstartammo == "stop" && !scripts\anim\utility::func_9D9B() && self.var_1491.pose == "stand")
	{
		func_E246();
		var_00 = scripts\anim\utility::func_B027("combat","trans_to_combat");
		self _meth_82E4("transition",var_00,%root,1,0.2,1.2 * self.animplaybackrate);
		func_43E3(var_00,"run");
		scripts\anim\shared::donotetracks("transition");
	}
}

//Function Number: 6
func_F8BD()
{
	if(self.var_1491.pose == "stand")
	{
		scripts\anim\animset::func_F2BE();
		return;
	}

	if(self.var_1491.pose == "crouch")
	{
		scripts\anim\animset::func_F2B6();
		return;
	}

	if(self.var_1491.pose == "prone")
	{
		scripts\anim\animset::func_F2BC();
		return;
	}
}

//Function Number: 7
func_F8A3()
{
	if(scripts\anim\utility_common::isusingsidearm() && self getteleportlonertargetplayer("stand"))
	{
		transitionto("stand");
	}

	func_F8BD();
	func_F296();
	thread func_1108A();
	self aiclearanim(%root,0.2);
	scripts\anim\combat_utility::func_FA8C(0.2);
	thread scripts\anim\combat_utility::func_1A3E();
	func_5123();
}

//Function Number: 8
func_1108A()
{
	self endon("killanimscript");
	wait(0.2);
	self.var_1491.movement = "stop";
}

//Function Number: 9
func_F337(param_00)
{
	if(isdefined(param_00))
	{
		self _meth_82D0(param_00);
	}
	else
	{
		self _meth_82D0();
	}

	if(scripts\common\utility::actor_is3d())
	{
		self.var_368 = -65;
		self.isbot = 65;
		self.setdevdvar = -56;
		self.setmatchdatadef = 56;
	}
}

//Function Number: 10
func_F296()
{
	func_F337();
	if(self.var_1491.pose == "stand" && !scripts\common\utility::actor_is3d())
	{
		self.var_368 = -45;
		self.isbot = 45;
	}

	self.var_129AF = self.var_504E;
	self.var_CBF8 = self.var_5042;
}

//Function Number: 11
func_FAAC()
{
	thread scripts\anim\track::func_11B07();
	thread func_DD26();
	thread scripts\anim\shoot_behavior::func_4F69("normal");
	thread func_13B3F();
	func_E251();
	if(isdefined(self.var_1491.var_B168))
	{
		scripts\anim\weaponlist::refillclip();
		self.var_1491.var_B168 = undefined;
	}

	self.var_1491.var_5956 = gettime() + randomintrange(500,1500);
}

//Function Number: 12
func_100A1(param_00)
{
	if(!scripts\anim\utility_common::usingrocketlauncher())
	{
		return 0;
	}

	return scripts\anim\utility::func_10000(param_00);
}

//Function Number: 13
func_1109D()
{
	if(self.var_1491.pose != "stand" && self.var_1491.pose != "crouch")
	{
		transitionto("crouch");
	}

	if(self.var_1491.pose == "stand")
	{
		scripts\anim\shared::func_1180E(scripts\anim\utility::func_B027("combat","drop_rpg_stand"));
	}
	else
	{
		scripts\anim\shared::func_1180E(scripts\anim\utility::func_B027("combat","drop_rpg_crouch"));
	}

	self aiclearanim(%root,0.2);
	scripts\anim\combat_utility::func_631A();
	func_F8BD();
	scripts\anim\combat_utility::func_10D9A();
}

//Function Number: 14
func_7E71(param_00)
{
	if(self.var_1491.pose != "stand" && self getteleportlonertargetplayer("stand"))
	{
		if(param_00 < 81225)
		{
			return "stand";
		}

		if(isdefined(self.isnodeoccupied) && !self getpersstat(self.isnodeoccupied) || !self canshootenemy() && sighttracepassed(self.origin + (0,0,64),self.isnodeoccupied getshootatpos(),0,undefined))
		{
			self.var_1491.var_5956 = gettime() + 3000;
			return "stand";
		}
	}

	if(param_00 > 262144 && self.var_1491.pose != "crouch" && self getteleportlonertargetplayer("crouch") && !scripts\common\utility::actor_is3d() && !scripts\anim\utility_common::isusingsidearm() && !isdefined(self.heat) && gettime() >= self.var_1491.var_5956 && lengthsquared(self.var_FE9F) < 10000)
	{
		if(!isdefined(self.var_FECF) || sighttracepassed(self.origin + (0,0,36),self.var_FECF,0,undefined))
		{
			return "crouch";
		}
	}

	return undefined;
}

//Function Number: 15
func_6A11(param_00)
{
	var_01 = scripts\anim\utility_common::isusingsidearm();
	if(!var_01 && func_391A())
	{
		if((isdefined(self.var_72DE) && self.var_1491.pose == "stand") || scripts\anim\utility_common::isasniper(0) && param_00 < 167772.2)
		{
			func_5AB9();
			return 1;
		}
	}

	if(scripts\anim\utility_common::needtoreload(0))
	{
		if(!var_01 && scripts\common\utility::cointoss() && !scripts\anim\utility_common::usingrocketlauncher() && scripts\anim\utility_common::isusingprimary() && param_00 < 167772.2 && self getteleportlonertargetplayer("stand"))
		{
			if(self.var_1491.pose != "stand")
			{
				transitionto("stand");
				return 1;
			}

			if(func_391A())
			{
				func_5AB9();
				return 1;
			}
		}

		func_6A19(0);
		return 1;
	}

	return 0;
}

//Function Number: 16
func_391A()
{
	if(isdefined(self.secondaryweapon) && scripts\anim\utility_common::isshotgun(self.secondaryweapon))
	{
		return 0;
	}

	if(isdefined(self.var_C009))
	{
		return 0;
	}

	return 1;
}

//Function Number: 17
func_5AB9()
{
	self.var_1491.pose = "stand";
	func_11381(scripts\anim\utility::func_B027("combat","primary_to_pistol"));
}

//Function Number: 18
func_10062(param_00)
{
	if(scripts\anim\utility_common::isusingsidearm() && self.var_1491.pose == "stand" && !isdefined(self.var_72DE))
	{
		if(param_00 > 262144)
		{
			return 1;
		}

		if(self.var_BC == "ambush_nodes_only" && !isdefined(self.isnodeoccupied) || !self getpersstat(self.isnodeoccupied))
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 19
func_DB34()
{
	func_11380(scripts\anim\utility::func_B027("combat","pistol_to_primary"));
}

//Function Number: 20
func_6A15()
{
	if(isdefined(self.heat) && self getwatcheddvar())
	{
		self ghost_target_position(self.target_remove,self.var_205.angles);
	}
}

//Function Number: 21
func_6A14()
{
	if(func_BEA0())
	{
		var_00 = 0.25;
		if(isdefined(self.var_FE9E) && !issentient(self.var_FE9E))
		{
			var_00 = 1.5;
		}

		var_01 = scripts\common\utility::getpredictedaimyawtoshootentorpos(var_00);
		if(func_129B2(var_01))
		{
			return 1;
		}
	}

	return 0;
}

//Function Number: 22
func_6A13()
{
	self endon("killanimscript");
	func_FAAC();
	func_E246(0);
	if(scripts\common\utility::actor_is3d())
	{
		var_00 = (0,self.angles[1],0);
		self orientmode("face angle 3d",var_00);
	}
	else
	{
		self orientmode("face angle",self.angles[1]);
	}

	for(;;)
	{
		if(scripts\anim\utility_common::usingrocketlauncher())
		{
			self.var_4E46 = undefined;
		}

		scripts\anim\utility::func_12EB9();
		if(func_136EA())
		{
			continue;
		}

		if(shouldmelee())
		{
			domelee();
		}

		func_6A15();
		if(!isdefined(self.var_FECF))
		{
			func_392C();
			continue;
		}

		func_E251();
		var_01 = lengthsquared(self.origin - self.var_FECF);
		if(func_100A1(var_01))
		{
			func_1109D();
			continue;
		}

		if(func_6A14())
		{
			continue;
		}

		if(func_453F())
		{
			continue;
		}

		if(func_6A11(var_01))
		{
			continue;
		}

		if(scripts\anim\utility_common::usingrocketlauncher() && self.var_1491.pose != "crouch" && randomfloat(1) > 0.65)
		{
			self.var_4E46 = ::func_E774;
		}

		if(func_10062(var_01))
		{
			func_DB34();
		}

		var_02 = func_7E71(var_01);
		if(isdefined(var_02) && var_02 != self.var_1491.pose)
		{
			transitionto(var_02);
			continue;
		}

		if(scripts\anim\combat_utility::func_1A3B())
		{
			func_FEDE();
			scripts\anim\combat_utility::func_8EBF();
			continue;
		}

		func_6A1C();
	}
}

//Function Number: 23
func_6A1C()
{
	if(!isdefined(self.isnodeoccupied) || !self getpersstat(self.isnodeoccupied))
	{
		self endon("enemy");
		self endon("shoot_behavior_change");
		wait(0.2 + randomfloat(0.1));
		self waittill("do_slow_things");
		return;
	}

	wait(0.05);
}

//Function Number: 24
func_10B70()
{
	if(isdefined(self.isnodeoccupied) && !self getpersstat(self.isnodeoccupied) || !self canshootenemy() && sighttracepassed(self.origin + (0,0,64),self.isnodeoccupied getshootatpos(),0,undefined))
	{
		self.var_1491.var_5956 = gettime() + 3000;
		transitionto("stand");
		return 1;
	}

	return 0;
}

//Function Number: 25
func_BEA0()
{
	var_00 = self.var_FECF;
	if(!isdefined(var_00))
	{
		return 0;
	}

	var_01 = self.angles[1] - vectortoyaw(var_00 - self.origin);
	var_02 = distancesquared(self.origin,var_00);
	if(var_02 < 65536)
	{
		var_03 = sqrt(var_02);
		if(var_03 > 3)
		{
			var_01 = var_01 + asin(-3 \ var_03);
		}
	}

	return scripts\common\utility::absangleclamp180(var_01) > self.var_129AF;
}

//Function Number: 26
func_136EA()
{
	var_00 = self.var_1491.pose;
	if(isdefined(self.var_1491.onback))
	{
		wait(0.1);
		return 1;
	}

	if(var_00 == "stand" && isdefined(self.heat))
	{
		return 0;
	}

	if(!self getteleportlonertargetplayer(var_00))
	{
		var_01 = "crouch";
		if(var_00 == "crouch")
		{
			var_01 = "stand";
		}

		var_02 = "prone";
		if(var_00 == "prone")
		{
			var_01 = "stand";
			var_02 = "crouch";
		}

		if(self getteleportlonertargetplayer(var_01))
		{
			if(var_00 == "stand" && scripts\anim\utility_common::isusingsidearm())
			{
				return 0;
			}

			transitionto(var_01);
			return 1;
		}
		else if(self getteleportlonertargetplayer(var_02))
		{
			if(var_00 == "stand" && scripts\anim\utility_common::isusingsidearm())
			{
				return 0;
			}

			transitionto(var_02);
			return 1;
		}
		else
		{
		}
	}

	return 0;
}

//Function Number: 27
func_392C()
{
	if(self.var_1491.pose != "stand" && self getteleportlonertargetplayer("stand") && func_10B70())
	{
		return 1;
	}

	var_00 = gettime();
	self.var_1491.var_5956 = var_00 + 1500;
	if(isdefined(self.group) && isdefined(self.var_8677.missionfailed))
	{
		var_01 = angleclamp180(self.angles[1] - vectortoyaw(self.var_8677.missionfailed));
		if(func_129B2(var_01))
		{
			return 1;
		}
	}

	if(isdefined(self.target_getindexoftarget) && isdefined(level.var_9D8E[self.var_205.type]))
	{
		var_01 = angleclamp180(self.angles[1] - self.var_205.angles[1]);
		if(func_129B2(var_01))
		{
			return 1;
		}
	}
	else if((isdefined(self.isnodeoccupied) && self seerecently(self.isnodeoccupied,2)) || var_00 > self.var_1491.var_EF87 + 1200)
	{
		var_01 = undefined;
		var_02 = self getsafeanimmovedeltapercentage();
		if(isdefined(var_02))
		{
			var_01 = angleclamp180(self.angles[1] - var_02[1]);
		}
		else if(isdefined(self.target_getindexoftarget))
		{
			var_01 = angleclamp180(self.angles[1] - self.var_205.angles[1]);
		}
		else if(isdefined(self.isnodeoccupied))
		{
			var_02 = vectortoangles(self lastknownpos(self.isnodeoccupied) - self.origin);
			var_01 = angleclamp180(self.angles[1] - var_02[1]);
		}

		if(isdefined(var_01) && func_129B2(var_01))
		{
			return 1;
		}
	}
	else if(isdefined(self.heat) && self _meth_8213())
	{
		var_01 = angleclamp180(self.angles[1] - self.var_205.angles[1]);
		if(func_129B2(var_01))
		{
			return 1;
		}
	}

	if(func_453F())
	{
		return 1;
	}

	var_03 = self.var_1491.var_BF82 < var_00;
	var_04 = 0;
	if(var_03)
	{
		var_04 = 0.99999;
	}

	if(scripts\anim\utility_common::needtoreload(var_04))
	{
		func_6A19(var_04);
		return 1;
	}

	if(var_03 && scripts\anim\utility_common::isusingsidearm())
	{
		if(func_11380(scripts\anim\utility::func_B027("combat","pistol_to_primary")))
		{
			return 1;
		}
	}

	func_392D();
	return 1;
}

//Function Number: 28
func_392D()
{
	self endon("shoot_behavior_change");
	wait(0.4 + randomfloat(0.4));
	self waittill("do_slow_things");
}

//Function Number: 29
func_E251()
{
	self.var_1491.var_BF82 = gettime() + randomintrange(2000,4000);
}

//Function Number: 30
func_129B2(param_00)
{
	if(param_00 < 0 - self.var_129AF)
	{
		if(self.var_1491.pose == "prone")
		{
			scripts\anim\cover_prone::func_DA87("crouch");
			scripts\anim\animset::func_F2B6();
		}

		func_5AC8("right",0 - param_00);
		scripts\sp\_gameskill::func_54C4();
		return 1;
	}

	if(param_00 > self.var_129AF)
	{
		if(self.var_1491.pose == "prone")
		{
			scripts\anim\cover_prone::func_DA87("crouch");
			scripts\anim\animset::func_F2B6();
		}

		func_5AC8("left",param_00);
		scripts\sp\_gameskill::func_54C4();
		return 1;
	}

	return 0;
}

//Function Number: 31
func_13B3F()
{
	self endon("killanimscript");
	self.var_FE9F = (0,0,0);
	var_00 = undefined;
	var_01 = self.origin;
	var_02 = 0.15;
	for(;;)
	{
		if(isdefined(self.var_FE9E) && isdefined(var_00) && self.var_FE9E == var_00)
		{
			var_03 = self.var_FE9E.origin;
			self.var_FE9F = var_03 - var_01 * 1 \ var_02;
			var_01 = var_03;
		}
		else
		{
			if(isdefined(self.var_FE9E))
			{
				var_01 = self.var_FE9E.origin;
			}
			else
			{
				var_01 = self.origin;
			}

			var_00 = self.var_FE9E;
			self.var_FE9F = (0,0,0);
		}

		wait(var_02);
	}
}

//Function Number: 32
func_100A6()
{
	return 0;
}

//Function Number: 33
donotetrackswithendon(param_00)
{
	self endon("killanimscript");
	scripts\anim\shared::donotetracks(param_00);
}

//Function Number: 34
func_6A6F()
{
	self endon("killanimscript");
	self notify("facing_enemy_immediately");
	self endon("facing_enemy_immediately");
	var_00 = 5;
	for(;;)
	{
		var_01 = 0 - scripts\anim\utility_common::getyawtoenemy();
		if(abs(var_01) < 2)
		{
			break;
		}

		if(abs(var_01) > var_00)
		{
			var_01 = var_00 * scripts\common\utility::sign(var_01);
		}

		self orientmode("face angle",self.angles[1] + var_01);
		wait(0.05);
	}

	self orientmode("face current");
	self notify("can_stop_turning");
}

//Function Number: 35
isdeploying(param_00)
{
	var_01 = getmovedelta(param_00,0,1);
	var_02 = self gettweakablevalue(var_01);
	return self _meth_81A5(var_02) && self maymovetopoint(var_02);
}

//Function Number: 36
func_9D43(param_00)
{
	var_01 = getmovedelta(param_00,0,1);
	var_02 = self gettweakablevalue(var_01);
	return self _meth_81A5(var_02);
}

//Function Number: 37
func_5AC8(param_00,param_01)
{
	var_02 = isdefined(self.var_FECF);
	var_03 = 1;
	var_04 = 0.2;
	var_05 = isdefined(self.isnodeoccupied) && !isdefined(self.var_129B3) && self seerecently(self.isnodeoccupied,2) && distancesquared(self.var_10C.origin,self.origin) < 262144;
	if(self.var_1491.var_EF87 + 500 > gettime())
	{
		var_04 = 0.25;
		if(var_05)
		{
			thread func_6A6F();
		}
	}
	else if(var_05)
	{
		var_06 = 1 - distance(self.var_10C.origin,self.origin) \ 512;
		var_03 = 1 + var_06 * 1;
		if(var_03 > 2)
		{
			var_04 = 0.05;
		}
		else if(var_03 > 1.3)
		{
			var_04 = 0.1;
		}
		else
		{
			var_04 = 0.15;
		}
	}

	var_07 = 0;
	if(param_01 > 157.5)
	{
		var_07 = 180;
	}
	else if(param_01 > 112.5)
	{
		var_07 = 135;
	}
	else if(param_01 > 67.5)
	{
		var_07 = 90;
	}
	else
	{
		var_07 = 45;
	}

	var_08 = "turn_" + param_00 + "_" + var_07;
	var_09 = scripts\anim\utility::func_1F64(var_08);
	if(isdefined(self.var_129B3))
	{
		self animmode("angle deltas",0);
	}
	else if(isdefined(self.target_getindexoftarget) && isdefined(level.var_9D8D[self.var_205.type]) && distancesquared(self.origin,self.var_205.origin) < 256)
	{
		self animmode("angle deltas",0);
	}
	else if(func_9D43(var_09))
	{
		func_E246();
	}
	else
	{
		self animmode("angle deltas",0);
	}

	self _meth_82A5(%exposed_aiming,%body,1,var_04);
	if(!isdefined(self.var_129B3))
	{
		func_129A1(var_04);
	}

	self _meth_82AC(%turn,1,var_04);
	if(isdefined(self.heat))
	{
		var_03 = min(1,var_03);
	}
	else if(isdefined(self.var_129B3))
	{
		var_03 = max(1.5,var_03);
	}

	self _meth_82E6("turn",var_09,1,var_04,var_03);
	func_43E3(var_09,"aim");
	self notify("turning");
	if(var_02 && !isdefined(self.var_129B3) && !isdefined(self.heat))
	{
		thread func_FEEC();
	}

	func_5AC9();
	self _meth_82AC(%turn,0,0.2);
	if(!isdefined(self.var_129B3))
	{
		func_129A0(0.2);
	}

	if(!isdefined(self.var_129B3))
	{
		self aiclearanim(%turn,0.2);
		self setanimknob(%exposed_aiming,1,0.2,1);
	}
	else
	{
		self aiclearanim(%exposed_modern,0.3);
	}

	if(isdefined(self.var_129A5))
	{
		self.var_129A5 = undefined;
		thread func_6A6F();
	}

	func_E246(0);
	self notify("done turning");
}

//Function Number: 38
func_5AC9()
{
	self endon("can_stop_turning");
	scripts\anim\shared::donotetracks("turn");
}

//Function Number: 39
func_B2B2()
{
	self endon("killanimscript");
	self endon("done turning");
	var_00 = self.angles[1];
	wait(0.3);
	if(self.angles[1] == var_00)
	{
		self notify("turning_isnt_working");
		self.var_129A5 = 1;
	}
}

//Function Number: 40
func_129A1(param_00)
{
	self _meth_82AC(scripts\anim\utility::func_1F64("straight_level"),0,param_00);
	self give_attacker_kill_rewards(%add_idle,0,param_00);
	if(!scripts\anim\utility_common::weapon_pump_action_shotgun())
	{
		self aiclearanim(%add_fire,0.2);
	}
}

//Function Number: 41
func_129A0(param_00)
{
	self _meth_82AC(scripts\anim\utility::func_1F64("straight_level"),1,param_00);
	self give_attacker_kill_rewards(%add_idle,1,param_00);
}

//Function Number: 42
func_FEEC()
{
	self endon("killanimscript");
	self endon("done turning");
	if(scripts\anim\utility_common::usingrocketlauncher())
	{
		return;
	}

	scripts\anim\combat_utility::func_FEDF();
	self aiclearanim(%add_fire,0.2);
}

//Function Number: 43
func_FEDE()
{
	thread func_13A4D();
	self endon("need_to_turn");
	thread func_A57F();
	scripts\anim\combat_utility::func_FEDF();
	self notify("stop_watching_for_need_to_turn");
	self notify("stop_trying_to_melee");
}

//Function Number: 44
func_13A4D()
{
	self endon("killanimscript");
	self endon("stop_watching_for_need_to_turn");
	var_00 = gettime() + 4000 + randomint(2000);
	for(;;)
	{
		if(gettime() > var_00 || func_BEA0())
		{
			self notify("need_to_turn");
			break;
		}

		wait(0.1);
	}
}

//Function Number: 45
func_453F()
{
	if(!scripts\anim\combat_utility::func_BE18())
	{
		return 0;
	}

	if(isdefined(level.var_11813) && isalive(level.player))
	{
		if(func_1289C(level.player,200))
		{
			return 1;
		}
	}

	if(isdefined(self.isnodeoccupied) && func_1289C(self.isnodeoccupied,self.var_B781))
	{
		return 1;
	}

	self.var_1491.nextgrenadetrytime = gettime() + 500;
	return 0;
}

//Function Number: 46
func_1289C(param_00,param_01)
{
	var_02 = 0;
	if(isdefined(self.dontevershoot) || isdefined(param_00.var_5951))
	{
		return 0;
	}

	if(!isdefined(self.var_1491.var_2274["exposed_grenade"]))
	{
		return 0;
	}

	var_03 = param_00.origin;
	if(!self getpersstat(param_00))
	{
		if(isdefined(self.isnodeoccupied) && param_00 == self.isnodeoccupied && isdefined(self.var_FECF))
		{
			var_03 = self.var_FECF;
		}
	}

	if(!self getpersstat(param_00))
	{
		param_01 = 100;
	}

	if(distancesquared(self.origin,var_03) > param_01 * param_01 && self.var_1491.pose == self.var_1491.var_85E2)
	{
		scripts\anim\combat_utility::func_F62B(param_00);
		if(!scripts\anim\combat_utility::_meth_85B5(param_00))
		{
			return 0;
		}

		var_04 = scripts\common\utility::getyawtospot(var_03);
		if(abs(var_04) < 60)
		{
			var_05 = [];
			foreach(var_07 in self.var_1491.var_2274["exposed_grenade"])
			{
				if(isdeploying(var_07))
				{
					var_05[var_05.size] = var_07;
				}
			}

			if(var_05.size > 0)
			{
				self give_attacker_kill_rewards(%exposed_aiming,0,0.1);
				func_43D0();
				self animmode("zonly_physics");
				scripts\anim\track::func_F641(0,0);
				var_02 = scripts\anim\combat_utility::func_128A0(param_00,var_05[randomint(var_05.size)]);
				self give_attacker_kill_rewards(%exposed_aiming,1,0.1);
				func_43E3(undefined,"aim");
				if(var_02)
				{
					scripts\anim\track::func_F641(1,0.5);
				}
				else
				{
					scripts\anim\track::func_F641(1,0);
				}
			}
		}
	}

	if(var_02)
	{
		scripts\sp\_gameskill::func_54C4();
	}

	return var_02;
}

//Function Number: 47
transitionto(param_00)
{
	if(param_00 == self.var_1491.pose)
	{
		return;
	}

	var_01 = self.var_1491.pose + "_2_" + param_00;
	if(!isdefined(self.var_1491.var_2274))
	{
		return;
	}

	var_02 = self.var_1491.var_2274[var_01];
	if(!isdefined(var_02))
	{
		return;
	}

	self aiclearanim(%root,0.3);
	scripts\anim\combat_utility::func_631A();
	if(param_00 == "stand")
	{
		var_03 = 2;
	}
	else
	{
		var_03 = 1.5;
	}

	if(!animhasnotetrack(var_02,"anim_pose = \" + param_00 + "\"))
	{
	}

	self _meth_82E4("trans",var_02,%body,1,0.2,var_03);
	func_43E3(var_02,"run");
	var_04 = getanimlength(var_02) \ var_03;
	var_05 = var_04 - 0.3;
	if(var_05 < 0.2)
	{
		var_05 = 0.2;
	}

	scripts\anim\notetracks::donotetracksfortime(var_05,"trans");
	self.var_1491.pose = param_00;
	func_F8BD();
	scripts\anim\combat_utility::func_10D9A();
	scripts\sp\_gameskill::func_54C4();
}

//Function Number: 48
func_A57F()
{
	self endon("killanimscript");
	self endon("stop_trying_to_melee");
	self endon("done turning");
	self endon("need_to_turn");
	self endon("shoot_behavior_change");
	for(;;)
	{
		wait(0.2 + randomfloat(0.3));
		if(isdefined(self.isnodeoccupied))
		{
			if(isplayer(self.isnodeoccupied))
			{
				var_00 = -25536;
			}
			else
			{
				var_00 = 10000;
			}

			if(distancesquared(self.var_10C.origin,self.origin) < var_00)
			{
				if(shouldmelee())
				{
					domelee();
				}
			}
		}
	}
}

//Function Number: 49
shouldmelee()
{
}

//Function Number: 50
domelee()
{
}

//Function Number: 51
func_5123()
{
	if(isdefined(self.var_C070))
	{
		return;
	}

	if(isplayer(self.isnodeoccupied))
	{
	}
}

//Function Number: 52
func_6A19(param_00)
{
	self.var_1491.var_6A1A = 1;
	scripts\anim\combat_utility::func_631A();
	var_01 = undefined;
	if(isdefined(self.var_1096A))
	{
		var_01 = self [[ self.var_1096A ]]();
		self.sendclientmatchdata = 1;
	}
	else
	{
		var_01 = scripts\anim\utility::func_1F67("reload");
		if(self.var_1491.pose == "stand" && scripts\anim\utility::func_1F65("reload_crouchhide") && scripts\common\utility::cointoss())
		{
			var_01 = scripts\anim\utility::func_1F67("reload_crouchhide");
		}
	}

	thread func_A57F();
	self.var_6CDB = 0;
	if(weaponclass(self.var_394) == "pistol")
	{
		self orientmode("face default");
	}

	func_5A66(var_01,param_00 > 0.05);
	self notify("abort_reload");
	self orientmode("face current");
	if(self.var_6CDB)
	{
		scripts\anim\weaponlist::refillclip();
	}

	self aiclearanim(%reload,0.2);
	self.sendclientmatchdata = 0;
	self notify("stop_trying_to_melee");
	self.var_1491.var_6A1A = 0;
	self.var_6CDB = undefined;
	scripts\sp\_gameskill::func_54C4();
	scripts\anim\combat_utility::func_10D9A();
}

//Function Number: 53
func_5A66(param_00,param_01)
{
	self endon("abort_reload");
	if(param_01)
	{
		thread func_152A();
	}

	var_02 = 1;
	if(!scripts\anim\utility_common::isusingsidearm() && !scripts\anim\utility_common::isshotgun(self.var_394) && isdefined(self.isnodeoccupied) && self getpersstat(self.isnodeoccupied) && distancesquared(self.var_10C.origin,self.origin) < 1048576)
	{
		var_02 = 1.2;
	}

	var_03 = "reload_" + scripts\anim\combat_utility::_meth_81EB();
	self aiclearanim(%root,0.2);
	self _meth_82EA(var_03,param_00,1,0.2,var_02);
	func_43E3(param_00,"run");
	thread func_C16A("abort_reload",var_03);
	self endon("start_aim");
	scripts\anim\shared::donotetracks(var_03);
	self.var_6CDB = 1;
}

//Function Number: 54
func_152A()
{
	self endon("abort_reload");
	self endon("killanimscript");
	for(;;)
	{
		if(isdefined(self.var_FE9E) && self getpersstat(self.var_FE9E))
		{
			break;
		}

		wait(0.05);
	}

	self notify("abort_reload");
}

//Function Number: 55
func_C16A(param_00,param_01)
{
	self endon(param_00);
	self waittillmatch("start_aim",param_01);
	self.var_6CDB = 1;
	self notify("start_aim");
}

//Function Number: 56
func_6CDE(param_00)
{
	self endon("killanimscript");
	scripts\anim\shared::donotetracks(param_00);
}

//Function Number: 57
func_5D15()
{
	scripts\sp\_mgturret::func_5EEF();
	scripts\anim\weaponlist::refillclip();
	self.var_1491.needstorechamber = 0;
	self notify("dropped_gun");
	scripts\sp\_mgturret::func_E2DB();
}

//Function Number: 58
func_68C7()
{
	func_5D15();
}

//Function Number: 59
func_11381(param_00)
{
	self endon("killanimscript");
	thread scripts\anim\combat_utility::putgunbackinhandonkillanimscript();
	scripts\anim\combat_utility::func_631A();
	self.var_11317 = param_00;
	self _meth_82E4("weapon swap",param_00,%body,1,0.2,scripts\anim\combat_utility::func_6B9A());
	func_43E3(param_00,"run");
	donotetrackspostcallbackwithendon("weapon swap",::func_89D2,"end_weapon_swap");
	self aiclearanim(self.var_11317,0.2);
	self notify("facing_enemy_immediately");
	self notify("switched_to_sidearm");
	scripts\sp\_gameskill::func_54C4();
}

//Function Number: 60
donotetrackspostcallbackwithendon(param_00,param_01,param_02)
{
	self endon(param_02);
	scripts\anim\notetracks::donotetrackspostcallback(param_00,param_01);
}

//Function Number: 61
func_6A6E(param_00)
{
	self endon("killanimscript");
	wait(param_00);
	func_6A6F();
}

//Function Number: 62
func_89D2(param_00)
{
	foreach(var_02 in param_00)
	{
		if(var_02 == "pistol_pickup")
		{
			self aiclearanim(scripts\anim\utility::func_1F64("straight_level"),0);
			scripts\anim\animset::func_F2BE();
			thread func_6A6E(0.25);
			continue;
		}

		if(var_02 == "start_aim")
		{
			scripts\anim\combat_utility::func_10D9A();
			if(func_BEA0())
			{
				self notify("end_weapon_swap");
			}
		}
	}
}

//Function Number: 63
func_11380(param_00,param_01)
{
	self endon("killanimscript");
	if(scripts\anim\utility_common::isshotgun(self.primaryweapon) && isdefined(self.var_138DF) && !self.var_138DF && self.lastweapon == scripts\anim\utility::getaiprimaryweapon())
	{
		return 0;
	}

	scripts\anim\combat_utility::func_631A();
	self.var_11317 = param_00;
	self _meth_82E4("weapon swap",param_00,%body,1,0.1,1);
	func_43E3(param_00,"run");
	if(isdefined(param_01))
	{
		donotetrackspostcallbackwithendon("weapon swap",::func_8984,"end_weapon_swap");
	}
	else
	{
		donotetrackspostcallbackwithendon("weapon swap",::func_89D7,"end_weapon_swap");
	}

	self aiclearanim(self.var_11317,0.2);
	self notify("switched_to_lastweapon");
	scripts\sp\_gameskill::func_54C4();
	return 1;
}

//Function Number: 64
func_89D7(param_00)
{
	foreach(var_02 in param_00)
	{
		if(var_02 == "pistol_putaway")
		{
			self aiclearanim(scripts\anim\utility::func_1F64("straight_level"),0);
			scripts\anim\animset::func_F2BE();
			thread scripts\anim\combat_utility::putgunbackinhandonkillanimscript();
			continue;
		}

		if(var_02 == "start_aim")
		{
			scripts\anim\combat_utility::func_10D9A();
			if(func_BEA0())
			{
				self notify("end_weapon_swap");
			}
		}
	}
}

//Function Number: 65
func_8984(param_00)
{
	foreach(var_02 in param_00)
	{
		if(var_02 == "pistol_putaway")
		{
			thread scripts\anim\combat_utility::putgunbackinhandonkillanimscript();
			continue;
		}

		if(issubstr(var_02,"anim_gunhand"))
		{
			self notify("end_weapon_swap");
		}
	}
}

//Function Number: 66
func_E774()
{
	if(!scripts\anim\utility_common::usingrocketlauncher() || self.bulletsinclip == 0)
	{
		return 0;
	}

	if(randomfloat(1) > 0.5)
	{
		var_00 = scripts\anim\utility::func_B027("combat","rpg_death");
	}
	else
	{
		var_00 = scripts\anim\utility::func_B027("combat","rpg_death_stagger");
	}

	self _meth_82E3("deathanim",var_00,%root,1,0.05,1);
	func_43E3(var_00,"death");
	scripts\anim\shared::donotetracks("deathanim");
	scripts\anim\shared::func_5D1A();
}

//Function Number: 67
func_DD26()
{
	self endon("killanimscript");
	self.var_1491.var_6A1A = 0;
	for(;;)
	{
		wait(0.2);
		if(isdefined(self.isnodeoccupied) && !self seerecently(self.isnodeoccupied,2))
		{
			if(self.var_BC == "ambush" || self.var_BC == "ambush_nodes_only")
			{
				continue;
			}
		}

		func_1289B();
	}
}

//Function Number: 68
func_1289B()
{
	if(self.logstring)
	{
		return;
	}

	if(!isdefined(self.isnodeoccupied))
	{
		self.var_DD23 = 0;
		return;
	}

	if(gettime() < self.var_33B)
	{
		self.var_DD23 = 0;
		return;
	}

	if(isdefined(self.var_D895) && self.var_D895 != self.isnodeoccupied)
	{
		self.var_DD23 = 0;
		self.var_D895 = undefined;
		return;
	}

	self.var_D895 = self.isnodeoccupied;
	if(self getpersstat(self.isnodeoccupied) && self canshootenemy())
	{
		self.var_DD23 = 0;
		return;
	}

	if(isdefined(self.var_6CDB) && !self.var_6CDB)
	{
		self.var_DD23 = 0;
		return;
	}

	if(!isdefined(self.var_DD24) || !self.var_DD24)
	{
		var_00 = vectornormalize(self.var_10C.origin - self.origin);
		var_01 = anglestoforward(self.angles);
		if(vectordot(var_00,var_01) < 0.5)
		{
			self.var_DD23 = 0;
			return;
		}
	}

	if(self.var_1491.var_6A1A && scripts\anim\utility_common::needtoreload(0.25) && self.var_10C.health > self.var_10C.maxhealth * 0.5)
	{
		self.var_DD23 = 0;
		return;
	}

	if(scripts\anim\combat_utility::func_10026() && self.var_DD23 < 3)
	{
		self.var_DD23 = 3;
	}

	switch(self.var_DD23)
	{
		case 0:
			if(self getzonearray(32))
			{
				return;
			}
			break;

		case 1:
			if(self getzonearray(64))
			{
				self.var_DD23 = 0;
				return;
			}
			break;

		case 2:
			if(self getzonearray(96))
			{
				self.var_DD23 = 0;
				return;
			}
			break;

		case 3:
			if(scripts\anim\combat_utility::func_128AA(0))
			{
				self.var_DD23 = 0;
				return;
			}
			break;

		case 4:
			if(!self getpersstat(self.isnodeoccupied) || !self canshootenemy())
			{
				self _meth_80EC();
			}
			break;

		default:
			if(self.var_DD23 > 15)
			{
				self.var_DD23 = 0;
				return;
			}
			break;
	}

	self.var_DD23++;
}

//Function Number: 69
func_E246(param_00)
{
	var_01 = param_00;
	if(!isdefined(var_01))
	{
		var_01 = 1;
	}

	if(scripts\common\utility::actor_is3d())
	{
		self animmode("nogravity",var_01);
		return;
	}

	self animmode("zonly_physics",var_01);
}

//Function Number: 70
func_43E3(param_00,param_01)
{
	self.facialidx = scripts\anim\face::playfacialanim(param_00,param_01,self.facialidx);
}

//Function Number: 71
func_43D0()
{
	self.facialidx = undefined;
	self aiclearanim(%head,0.2);
}