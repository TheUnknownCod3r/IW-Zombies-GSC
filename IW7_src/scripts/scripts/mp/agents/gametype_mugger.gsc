/*******************************************************************
 * Decompiled By: Bog
 * Decompiled File: scripts\mp\agents\gametype_mugger.gsc
 * Game: Call of Duty: Infinite Warfare
 * Platform: PC
 * Function Count: 4
 * Decompile Time: 229 ms
 * Timestamp: 10/27/2023 12:11:37 AM
*******************************************************************/

//Function Number: 1
main()
{
	setup_callbacks();
}

//Function Number: 2
setup_callbacks()
{
	level.agent_funcs["squadmate"]["gametype_update"] = ::agent_squadmember_mugger_think;
	level.agent_funcs["player"]["think"] = ::agent_player_mugger_think;
}

//Function Number: 3
agent_player_mugger_think()
{
	thread scripts\mp\bots\gametype_mugger::bot_mugger_think();
}

//Function Number: 4
agent_squadmember_mugger_think()
{
	if(!isdefined(self.tags_seen_by_owner))
	{
		self.tags_seen_by_owner = [];
	}

	if(!isdefined(self.next_time_check_tags))
	{
		self.next_time_check_tags = gettime() + 500;
	}

	if(gettime() > self.next_time_check_tags)
	{
		self.next_time_check_tags = gettime() + 500;
		var_00 = 0.78;
		if(isbot(self.triggerportableradarping))
		{
			var_00 = self botgetfovdot();
		}

		var_01 = self.triggerportableradarping getnearestnode();
		if(isdefined(var_01))
		{
			var_02 = self.triggerportableradarping scripts\mp\bots\gametype_mugger::bot_find_visible_tags_mugger(var_01,var_00);
			self.tags_seen_by_owner = scripts\mp\bots\gametype_conf::bot_combine_tag_seen_arrays(var_02,self.tags_seen_by_owner);
		}
	}

	self.tags_seen_by_owner = scripts\mp\bots\gametype_conf::bot_remove_invalid_tags(self.tags_seen_by_owner);
	var_03 = scripts\mp\bots\gametype_conf::bot_find_best_tag_from_array(self.tags_seen_by_owner,0);
	if(isdefined(var_03))
	{
		if(!isdefined(self.tag_getting) || distancesquared(var_03.curorigin,self.tag_getting.curorigin) > 1)
		{
			self.tag_getting = var_03;
			scripts\mp\bots\_bots_strategy::bot_defend_stop();
			self botsetscriptgoal(self.tag_getting.curorigin,0,"objective",undefined,level.bot_tag_obj_radius);
		}

		return 1;
	}
	else if(isdefined(self.tag_getting))
	{
		self botclearscriptgoal();
		self.tag_getting = undefined;
	}

	return 0;
}