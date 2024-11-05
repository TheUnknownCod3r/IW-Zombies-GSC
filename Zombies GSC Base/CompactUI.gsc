#include scripts\cp\cp_weapon;
//#include scripts\cp\cp_zmb\cp_zmb_ghost_activation;

init() {
	
	level.Status        = ["^1Unverified", "^3Verified", "^4VIP", "^6Admin", "^5Co-Host", "^2Host"];
    level.RGB           = ["Red", "Green", "Blue"];
    level.patchName     = "Synergy V3";
    level.creatorName   = "TheUnknownCoder";
	level.WeaponCategories = ["Assault Rifles", "Sub Machine Guns", "Light Machine Guns", "Sniper Rifles", "Shotguns", "Pistols", "Launchers", "Classic Weapons", "Melee Weapons", "Specialist Weapons", "Map Specific Weapons", "Other Weapons"];
	level.Assault = ["iw7_m4_zm", "iw7_sdfar_zm", "iw7_ar57_zm", "iw7_fmg_zm+akimbofmg_zm", "iw7_ake_zmr", "iw7_rvn_zm+meleervn", "iw7_vr_zm", "iw7_gauss_zm", "iw7_erad_zm"];
	level.SMG = ["iw7_fhr_zm", "iw7_crb_zml+crblscope_camo", "iw7_ripper_zmr", "iw7_ump45_zml+ump45lscope_camo", "iw7_crdb_zm", "iw7_mp28_zm", "iw7_tacburst_zm+gltacburst"];
	level.LMG = ["iw7_sdflmg_zm", "iw7_mauler_zm", "iw7_lmg03_zm", "iw7_minilmg_zm", "iw7_unsalmg_zm"];
	level.Snipers = ["iw7_kbs_zm", "iw7_m8_zm", "iw7_cheytac_zmr", "iw7_m1_zm", "iw7_ba50cal_zm", "iw7_longshot_zm+longshotlscope_zm"];
	level.Shotguns = ["iw7_devastator_zm", "iw7_sonic_zmr", "iw7_sdfshotty_zm+sdfshottyscope_camo", "iw7_spas_zmr", "iw7_mod2187_zm"];
	level.Pistols = ["iw7_emc_zm", "iw7_nrg_zm", "iw7_g18_zmr", "iw7_revolver_zm", "iw7_udm45_zm+udm45scope", "iw7_mag_zm"];
	level.Launchers = ["iw7_lockon_zm", "iw7_glprox_zm", "iw7_chargeshot_zm+chargeshotscope_camo"];
	level.Classics = ["iw7_m1c_zm", "iw7_g18c_zm", "iw7_ump45c_zm", "iw7_spasc_zm", "iw7_arclassic_zm", "iw7_cheytacc_zm"];
	level.Melee = ["iw7_axe_zm"];
	level.Specials = ["iw7_atomizer_mp", "iw7_penetrationrail_mp+penetrationrailscope", "iw7_steeldragon_mp", "iw7_claw_mp", "iw7_blackholegun_mp+blackholegunscope"];
	level.ARNames = ["NV4", "R3K", "KBAR-32", "Type-2", "Volk", "R-VN", "X-Con", "G-Rail", "Erad"];
	level.SMGNames = ["FHR-40", "Karma-45", "RPR Evo", "HVR", "VPR", "Trencher", "Raijin-EMX"];
	level.LMGNames = ["R.A.W.", "Mauler", "Titan", "Auger", "Atlas"];
	level.SniperNames = ["KBS Longbow", "EBR-800", "Widowmaker", "DMR-1", "Trek-50", "Proteus"];
	level.ShotgunNames = ["Reaver", "Banshee", "DCM-8", "Rack-9", "M.2187"];
	level.PistolNames = ["EMC", "Oni", "Kendall 44", "Hailstorm", "UDM", "Stallion 44"];
	level.LauncherNames = ["Spartan SA3", "Howitzer", "P-Law"];
	level.ClassicNames = ["M1", "Hornet", "MacTav-45", "S-Ravage", "OSA", "TF-141"];
	level.MeleeNames = ["Axe"];
	level.SpecialNames = ["Eraser", "Ballista EM3", "Steel Dragon", "Claw", "Gravity Vortex Gun", "Arm-2 Akimbo", "Turdlet"];
	level.SpacelandWeaps = ["iw7_forgefreeze_zm+forgefreezealtfire", "iw7_dischord_zm", "iw7_facemelter_zm", "iw7_headcutter_zm", "iw7_shredder_zm", "iw7_spaceland_wmd"];
	level.SpacelandNames = ["Forge Freeze", "Dischord", "Face Melter", "Head Cutter", "Shredder", "NX 2.0"];
	level.RaveWeaps = ["iw7_golf_club_mp", "iw7_spiked_bat_mp", "iw7_two_headed_axe_mp", "iw7_machete_mp", "iw7_harpoon1_zm", "iw7_harpoon2_zm", "iw7_harpoon3_zm+akimbo", "iw7_harpoon4_zm"];
	level.RaveNames = ["Golf Club", "Spiked Bat", "2 Headed Axe", "Machete", "Harpoon Gun 1", "Harpoon Gun 2", "Harpoon Gun 3", "Harpoon Gun 4"];
	level.ShaolinWeaps = ["iw7_katana_zm", "iw7_nunchucks_zm", "crane", "snake", "dragon", "tiger"];
	level.ShaolinNames = ["Katana", "Nunchucks", "Crane Chi", "Snake Chi", "Dragon Chi", "Tiger Chi"];
	level.AttackWeaps = ["iw7_cutie_zm"];
	level.AttackNames = ["Modular Atomic Disintegrator"];
	level.BeastWeaps = ["iw7_venomx_zm"];					 				
	level.BeastNames = ["Venom-X"];
	level.otherWeaps = ["iw7_fists_zm", "iw7_entangler_zm"];
	level.OtherNames = ["Fists", "Entangler"];
	level thread onPlayerConnect();
}

onPlayerConnect() {
	for(;;) {
		level waitTill("connected", player);
		executeCommand("sv_cheats 1");
		get_map_name();
		player thread onPlayerSpawned();
	    self.iPrintLnAlt = self createText("objective", 1, "LEFT", "TOP", 0, 400, 3, 0, "", (1, 1, 1));
	}
}
get_map_name() {
	level.mapName = getDvar("mapname");
}

onPlayerSpawned() {
	self endOn("disconnect");
	level endOn("game_ended");
	for(;;) {
		self waitTill("spawned_player");
		if(isDefined(self.playerSpawned)) {
			continue;
		}
		self.playerSpawned = true;
		
		if(!isDefined(level.initial_setup)) {
			level.initial_setup = true;
		}
		
		self thread on_event();
		self thread on_ended();
		level.invalid_orgs = [];
		if(self isHost()) {
			self freezeControls(false);
			self thread initializeSetup(5, self);
			wait 2;
		}else{ self.access = 0;}
		level thread RainbowColor();

		level thread createText("default", 1, "LEFT", "TOP", 5, 10, 3, 1, "TheUnknownCod3r", "rainbow");

	}
}
on_event() {
	self endOn("disconnect");
	//self.syn = [];
	//self.syn["user"] = spawnStruct();
	while (true) {
		
		break;
	}
}

on_ended() {
	level waitTill("game_ended");
	//if(self in_menu()) {
		//self close_menu();
	//}
	
	level notify("on_close_ended");
	level endOn("on_close_ended");
}
replaceChar(string, substring, replace)
{
    final = "";
    for(e=0;e<string.size;e++)
    {
        if(string[e] == substring)
            final += replace;
        else 
            final += string[e];
    }
    return final;
}

constructString(string)
{
    final = "";
    for(e=0;e<string.size;e++)
    {
        if(e == 0)
            final += toUpper(string[e]);
        else if(string[e-1] == " ")
            final += toUpper(string[e]);
        else 
            final += string[e];
    }
    return final;
}

iPrintLnAlt(String)
{
    self.iPrintLnAlt notify("StopFade");
    self.iPrintLnAlt.alpha = 1;
    self.iPrintLnAlt SetText(String);
    self.iPrintLnAlt thread hudFade(0, 4);
}  

return_toggle(variable) {
	return isDefined(variable) && variable;
}

really_alive() {
	return isAlive(self) && !return_toggle(self.lastStand);
}

set_text(text) {
	if(!isDefined(self) || !isDefined(text)) {
		return;
	}
	
	self.text = text;
	self setText(text);
}

set_shader(shader, width, height) {
	if(!isDefined(shader)) {
		if(!isDefined(self.shader)) {
			return;
		}
	
		shader = self.shader;
	}
	
	if(!isDefined(width)) {
		if(!isDefined(self.width)) {
			return;
		}
	
		width = self.width;
	}
	
	if(!isDefined(height)) {
		if(!isDefined(self.height)) {
			return;
		}
	
		height = self.height;
	}
	
	self.shader = shader;
	self.width = width;
	self.height = height;
	self setShader(shader, width, height);
}

createText(font, fontScale, align, relative, x, y, sort, alpha, text, color, movescale, isLevel)
{  
	textElem = (isDefined(isLevel) ? newClientHudElem(self) : newHudElem());
	textElem.font = font;
	textElem.fontscale = fontScale;
	textElem.alpha = alpha;
	textElem.sort = sort;
	textElem.foreground = true;
    textElem.hideWhenInMenu = (self.menuSetting["MenuStealth"] ? true : false);
    textElem.archived = (self.menuSetting["MenuStealth"] ? false : true);
    if(IsDefined(movescale))
        x += self.menuSetting["MenuX"];
        
    if(IsDefined(movescale))
        y += self.menuSetting["MenuY"];
	textElem.x = x;
	textElem.y = y;
	textElem.alignX = align;
	textElem.alignY = relative;
	textElem.horzAlign = align;
	textElem.vertAlign = relative;
    //textElem scripts\cp\utility::setPoint(align, relative, x, y);//Doesn't seem to work? Sadge
    if(color != "rainbow")
        textElem.color = color;
    else
        textElem.color = level.rainbowColour;
	textElem.text = text;
	textElem setText(text);
    return textElem;
}

createRectangle(align, relative, x, y, width, height, color, shader, sort, alpha, movescale, isLevel)
{
	boxElem = (isDefined(isLevel) ? newClientHudElem(self) : newHudElem());
	boxElem.elemType="icon";
	boxElem.children=[];
    if(IsDefined(movescale))
        x += self.menuSetting["MenuX"];
        
    if(IsDefined(movescale))
        y += self.menuSetting["MenuY"];
    boxElem.alpha=alpha;
	boxElem.sort = sort;
    boxElem.archived       = (self.menuSetting["MenuStealth"] ? false : true);
	boxElem.foreground = true;
	boxElem.hidden = false;
	boxElem.hideWhenInMenu = true;
	boxElem.x = x;
	boxElem.y = y;
	boxElem.alignX = align;
	boxElem.alignY = relative;
	boxElem.horzAlign = align;
	boxElem.vertAlign = relative;
    //boxElem scripts\cp\utility::setPoint(align, relative, x, y);
    if(color != "rainbow")
        boxElem.color = color;
    else
        boxElem thread doRainbow();
    
	boxElem setShader(shader, width, height);
    return boxElem;
}

affectElement(type, time, value)
{
    if(type == "x" || type == "y")
        self moveOverTime(time);
    else
        self fadeOverTime(time);
        
    if(type == "x")
        self.x = value;
    if(type == "y")
        self.y = value;
    if(type == "alpha")
        self.alpha = value;
    if(type == "color")
        self.color = value;
}

hudMoveX(x, time)
{
    self moveOverTime(time);
    self.x = x;
    wait time;
}
clear_option() {
	for(i = 0; i < self.menu["OPT"].element_list.size; i++) {
		clear_all(self.menu["OPT"][self.menu["OPTSCROLL"].element_list[i]]);
		self.menu["OPT"][self.menu["utility"].element_list[i]] = [];
	}
}

clear_all(array) {
	if(!isDefined(array)) {
		return;
	}
	
	keys = getArrayKeys(array);
	for(a = 0; a < keys.size; a++) {
		if(isArray(array[keys[a]])) {
			forEach(value in array[keys[a]])
				if( isDefined(value)) {
					value destroy();
				}
		} else {
			if(isDefined(array[keys[a]])) {
				array[keys[a]] destroy();
			}
		}
	}
}
hudFade(alpha, time)
{
    self fadeOverTime(time);
    self.alpha = alpha;
    wait time;
}

fadeToColor(colour, time)
{
    self endon("colors_over");
    self fadeOverTime(time);
    self.color = colour;
}

GetPresetColours(ID)
{
    RGB = [(0, 0, 0), (1, 0, 0), (0, 1, 0), (0, 0, 1), (1, 1, 0), (0, 1, 1), (1, .5, 0), (1, 0, 1), (1, 1, 1)];
    return RGB[ID];
}

GetColoursSlider(Bool)
{
    return (IsDefined(Bool) ? "|Red|Green|Blue|Yellow|Cyan|Orange|Purple|White" : "Black|Red|Green|Blue|Yellow|Cyan|Orange|Purple|White");
}

getName()
{
    return self.name;
}

round(val)
{
    val = val + "";
    new_val = "";
    for(e=0;e<val.size;e++)
    {
        new_val += val[e];
        if(val[e-1] == "." && e > 1)
            return new_val;
    }
    return val;
}

ArrayRandomize(array)
{
    for(i=0;i<array.size;i++)
    {
        j    = RandomInt(array.size);
        temp = array[i];
        array[i] = array[j];
        array[j] = temp;
    }
    return array;
}

bool(variable)
{
    return isdefined(variable) && int(variable);
}

GetFloatString(String)
{
  setDvar("Temp", String);
  return GetDvarFloat("Temp");
}

doRainbow(Fade)
{
    if(self.shader == "gradient_fadein")
    {
        if(IsDefined(Fade))
            self fadeToColor(level.GradRain, .5);
        else
            self.color = level.GradRain;
    }
    else
    {
        if(IsDefined(Fade))
            self fadeToColor(level.NonGradRain, .5);
        else
            self.color = level.NonGradRain;
    }
    
    wait .1;
    
    self endon("StopRainbow");
    while(IsDefined(self))
    {
        if(self.shader == "gradient_fadein")
            wait 1.3;
            
        self thread fadeToColor(level.rainbowColour, 1);
        wait 1;
    }
}

RainbowChecks()
{
    while(true)
    {
        level.GradRain = level.rainbowColour;
        wait 1.3;
        level.NonGradRain = level.rainbowColour;
        wait 1;
    }
}

RainbowColor()
{
    rainbow = spawnStruct();
    rainbow.r = 255;
    rainbow.g = 0;
    rainbow.b = 0;
    rainbow.stage = 0;
    time = 5;
    level.rainbowColour = (0, 0, 0);
    thread RainbowChecks();
    for(;;)
    {
        if(rainbow.stage == 0)
        {
            rainbow.b += time;
            if(rainbow.b == 255)
                rainbow.stage = 1;
        }
        else if(rainbow.stage == 1)
        {
            rainbow.r -= time;
            if(rainbow.r == 0)
                rainbow.stage = 2;
        }
        else if(rainbow.stage == 2)
        {
            rainbow.g += time;
            if(rainbow.g == 255)
                rainbow.stage = 3;
        }
        else if(rainbow.stage == 3)
        {
            rainbow.b -= time;
            if(rainbow.b == 0)
                rainbow.stage = 4;
        }
        else if(rainbow.stage == 4)
        {
            rainbow.r += time;
            if(rainbow.r == 255)
                rainbow.stage = 5;
        }
        else if(rainbow.stage == 5)
        {
            rainbow.g -= time;
            if(rainbow.g == 0)
                rainbow.stage = 0;
        }
        level.rainbowColour = (rainbow.r / 255, rainbow.g / 255, rainbow.b / 255);
        wait .05;
    }
}

destroyAll(array)
{
    if(!isDefined(array))
        return;
    keys = getArrayKeys(array);
    for(a=0;a<keys.size;a++)
    if(isDefined(array[keys[a]][0]))
        for(e=0;e<array[keys[a]].size;e++)
            array[keys[a]][e] destroy();
    else
        array[keys[a]] destroy();
}

IsInArray(array, element)
{
   if(!isdefined(element))
        return false;
        
   foreach(e in array)
        if(e == element)
            return true;
}

initializeSetup(access, player, allaccess)
{
    if(access == player.access && !IsDefined(player.isHost) && isDefined(player.access))
        return;
        
    if(isDefined(player.access) && player.access == 5)
        return; 
        
    player notify("end_menu");
    
    if(bool(player.menu["isOpen"]))
        player menuClose();
        
    player.menu         = [];
    player.previousMenu = [];
    player.PlayerHuds   = [];
	player.menu["utility"].element_list = ["text", "subMenu", "toggle", "category", "slider"];
    player.menu["isOpen"] = false;
    player.menu["isLocked"] = false;
    
    if(!isDefined(player.menu["current"]))
        player.menu["current"] = "main";
        
    player.access = access;
    
    if(player.access != 0)
    {
        player thread menuMonitor();
        player menuOptions();
        player.menuSetting["HUDEdit"] = true;
        player thread MenuLoad();
		player iPrintLn("You have Been Given "+GetAccessName(access));
        //player thread PrintMenuControls();
    }
}

AllPlayersAccess(access)
{
    foreach(player in level.players)
    {
        if(player IsHost() || player == self)
            continue;
            
        self thread initializeSetup(access, player, true);
        
        wait .1;
    }
}

GetAccessName(Val)
{
    Status = ["Unverified", "Verified", "VIP", "Admin", "Co-Host", "Host"];
    return Status[Val];
}

MenuSave()
{
    SaveDesgin = 
        SetMenuBool(self.menuSetting["MenuFreeze"]) +";"+
        SetMenuBool(self.menuSetting["MenuStealth"]) +";"+
        (self.menuSetting["BannerGradRainbow"] != "rainbow" ? 0 : "1") +";"+
        (self.menuSetting["ScrollerGradRainbow"] != "rainbow" ? 0 : "1") +";"+
        (self.menuSetting["BackgroundGradRainbow"] != "rainbow" ? 0 : "1") +";"+
        (self.menuSetting["BannerNoneRainbow"] != "rainbow" ? 0 : "1") +";"+
        round(self.menuSetting["ScrollerGradColor0"]) +";"+
        round(self.menuSetting["ScrollerGradColor1"]) +";"+
        round(self.menuSetting["ScrollerGradColor2"]) +";"+
        round(self.menuSetting["BackgroundGradColor0"]) +";"+
        round(self.menuSetting["BackgroundGradColor1"]) +";"+
        round(self.menuSetting["BackgroundGradColor2"]) +";"+
        round(self.menuSetting["BannerNoneColor0"]) +";"+
        round(self.menuSetting["BannerNoneColor1"]) +";"+
        round(self.menuSetting["BannerNoneColor2"]) +";"+
        round(self.menuSetting["BannerGradColor0"]) +";"+
        round(self.menuSetting["BannerGradColor1"]) +";"+
        round(self.menuSetting["BannerGradColor2"]) +";"+
        self.menuSetting["MenuX"] +";"+
        self.menuSetting["MenuY"] +";"+
        SetMenuBool(self.menuSetting["MenuGodmode"]) +";"+
        SetMenuBool(self.menuSetting["ShowClientINFO"]);
    
    setDvar(self getName() + "MenuDesign", SaveDesgin);
}

MenuLoad(Val)
{  
    if(!isdefined(self.menuSetting))
        self.menuSetting = [];
        
    MenuDefaults = strTok("0;1;1;1;0;1;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;1",";");
    
    if(!IsDefined(Val) || IsDefined(Val) && Val == 0)
    {
        
        if(GetDvar(self getName() + "MenuDesign").size > 0)
        {
            dvar         = GetDvar(self getName() + "MenuDesign"); 
            MenuDefaults = strTok(dvar, ";");
        }
    }
    
    self.menuSetting["MenuFreeze"] = GetMenuBool(MenuDefaults[0]);
    self.menuSetting["MenuGodmode"] = GetMenuBool(MenuDefaults[20]);
    self.menuSetting["MenuStealth"] = GetMenuBool(MenuDefaults[1]);
    self.menuSetting["ShowClientINFO"] = GetMenuBool(MenuDefaults[21]);
    
    self.menuSetting["ScrollerGradColor0"] = int(MenuDefaults[6]);
    self.menuSetting["ScrollerGradColor1"] = int(MenuDefaults[7]);
    self.menuSetting["ScrollerGradColor2"] = int(MenuDefaults[8]);
    
    self.menuSetting["BackgroundGradColor0"] = int(MenuDefaults[9]);
    self.menuSetting["BackgroundGradColor1"] = int(MenuDefaults[10]);
    self.menuSetting["BackgroundGradColor2"] = int(MenuDefaults[11]);
    
    self.menuSetting["BannerNoneColor0"] = int(MenuDefaults[12]);
    self.menuSetting["BannerNoneColor1"] = int(MenuDefaults[13]);
    self.menuSetting["BannerNoneColor2"] = int(MenuDefaults[14]);
    
    self.menuSetting["BannerGradColor0"] = int(MenuDefaults[15]);
    self.menuSetting["BannerGradColor1"] = int(MenuDefaults[16]);
    self.menuSetting["BannerGradColor2"] = int(MenuDefaults[17]);
    
    self.menuSetting["BannerGradRainbow"] = (MenuDefaults[2] == "1" ? "rainbow" : (GetFloatString(MenuDefaults[15]), GetFloatString(MenuDefaults[16]), GetFloatString(MenuDefaults[17])));
    self.menuSetting["ScrollerGradRainbow"] = (MenuDefaults[3] == "1" ? "rainbow" : (GetFloatString(MenuDefaults[6]), GetFloatString(MenuDefaults[7]), GetFloatString(MenuDefaults[8])));
    self.menuSetting["BackgroundGradRainbow"] = (MenuDefaults[4] == "1" ? "rainbow" : (GetFloatString(MenuDefaults[9]), GetFloatString(MenuDefaults[10]), GetFloatString(MenuDefaults[11])));
    self.menuSetting["BannerNoneRainbow"] = (MenuDefaults[5] == "1" ? "rainbow" : (GetFloatString(MenuDefaults[12]), GetFloatString(MenuDefaults[13]), GetFloatString(MenuDefaults[14])));
    
    self.menuSetting["MenuX"] = int(MenuDefaults[18]);
    self.menuSetting["MenuY"] = int(MenuDefaults[19]);
    
    if(IsDefined(Val) && Val == 1 || IsDefined(Val) && Val == 0)
    {
        self menuClose();
        waittillframeend;
        self menuOpen();
    }
}

GetMenuBool(String)
{
    return (String == "1" ? true : false);
}

SetMenuBool(variable)
{
    return (isdefined(variable) && int(variable) ? "1" : "0");
}

FreezeInMenu()
{
    self.menuSetting["MenuFreeze"] = !bool(self.menuSetting["MenuFreeze"]);
    self FreezeControls(self.menuSetting["MenuFreeze"] ? true : false);
}

MenuStealth()
{
    self.menuSetting["MenuStealth"] = !bool(self.menuSetting["MenuStealth"]);
}

MenuGodmode()
{
    self.menuSetting["MenuGodmode"] = !bool(self.menuSetting["MenuGodmode"]);
}

ShowClientINFO()
{
    self.menuSetting["ShowClientINFO"] = !bool(self.menuSetting["ShowClientINFO"]);
}

MoveMenu()
{
    self menuClose();
    
    MenuVisTemp = [];
    
    MenuVisTemp["BG"] = self createRectangle("TOPLEFT", "TOP", -425, 90, 170, int(8*15) + 45, (0,0,0), "white", 0, .6, true);
    MenuVisTemp["TITLE"] = self createText("default", 1.5, "CENTER", "TOP", -340, 105, 0, 1, "Menu Reposition", (1, 1, 1), true);
    MenuVisTemp["INFO0"] = self createText("default", 1.2, "CENTER", "CENTER", -340, -75, 0, 1, "Movement Controls", (1, 1, 1), true);
    MenuVisTemp["INFO1"] = self createText("default", 1, "CENTER", "CENTER", -340, -40, 0, 1, "UP - [{+attack}] DOWN - [{+speed_throw}]", (1, 1, 1), true);
    MenuVisTemp["INFO2"] = self createText("default", 1, "CENTER", "CENTER", -340, -30, 0, 1, "LEFT - [{+actionslot 4}] RIGHT - [{+actionslot 3}]", (1, 1, 1), true);
    MenuVisTemp["INFO3"] = self createText("default", 1, "CENTER", "CENTER", -340, 0, 0, 1, "CONFIRM PLACEMENT - [{+activate}]", (1, 1, 1), true);
    MenuVisTemp["INFO4"] = self createText("default", 1, "CENTER", "CENTER", -340, 10, 0, 1, "DISCARD CHANGES - [{+melee}]", (1, 1, 1), true);
    
    X = self.menuSetting["MenuX"];
    Y = self.menuSetting["MenuY"];
    
    while(self useButtonPressed())
        wait .05;
    
    while(!self meleeButtonPressed())
    {
        if(self attackButtonPressed())
        {
            Y += 10;
            foreach(HUD in MenuVisTemp)
                HUD.y += 10;
                
            wait .15;
        }
            
        if(self adsButtonPressed())
        {
            Y -= 10;
            foreach(HUD in MenuVisTemp)
                HUD.y -= 10;
                
            wait .15;
        }
       
        if(self FragButtonPressed())
        {
            X += 10;
            foreach(HUD in MenuVisTemp)
                HUD.x += 10;
                
            wait .15;
        }
            
        if(self SecondaryOffhandButtonPressed())
        {
            X -= 10;
            foreach(HUD in MenuVisTemp)
                HUD.x -= 10;
                
            wait .15;
        }
        
        if(self useButtonPressed())
        {
            self.menuSetting["MenuX"] = X;
            self.menuSetting["MenuY"] = Y;
            break;
        }
        
        wait .05;
    }
    
    while(self useButtonPressed() || self meleeButtonPressed())
        wait .05;
    
    self destroyAll(MenuVisTemp);
    self menuOpen();
}

MenuToggleRainbow(HUD)
{
    if(HUD == "Banner")
    {
        self.menuSetting[HUD + (bool(self.menuSetting["HUDEdit"]) ? "NoneRainbow" : "GradRainbow")] = (IsString(self.menuSetting[HUD + (bool(self.menuSetting["HUDEdit"]) ? "NoneRainbow" : "GradRainbow")]) ? 0 : "rainbow");
 
        if(!IsString(self.menuSetting[HUD + (bool(self.menuSetting["HUDEdit"]) ? "NoneRainbow" : "GradRainbow")]))
        {
            for(e=0;e<3;e++)
                self.menuSetting[HUD + (bool(self.menuSetting["HUDEdit"]) ? "NoneColor" : "GradColor") + e] = level.rainbowColour[e];
                
            self.menuSetting[HUD + (bool(self.menuSetting["HUDEdit"]) ? "NoneRainbow" : "GradRainbow")] = "rainbow";
        }
        
        if(IsString(self.menuSetting["BannerNoneRainbow"]))
            self.menu["UI"]["BGTitle"] thread doRainbow(true);
            
        if(IsString(self.menuSetting["BannerGradRainbow"]))
            self.menu["UI"]["BGTitle_Grad"] thread doRainbow(true);
    } 
    else
    {
        self.menuSetting[HUD + "GradRainbow"] = (IsString(self.menuSetting[HUD + "GradRainbow"]) ? 0 : "rainbow");
  
        if(!IsString(self.menuSetting[HUD + "GradRainbow"]))
        {
            for(e=0;e<3;e++)
                self.menuSetting[HUD + "GradColor" + e] = level.rainbowColour[e];
                
            self.menuSetting[HUD + "GradRainbow"] = "rainbow";
        }
        
        if(IsString(self.menuSetting["ScrollerGradRainbow"]))
            self.menu["UI"]["SCROLL"] thread doRainbow(true);
            
        if(IsString(self.menuSetting["BackgroundGradRainbow"]))
            self.menu["UI"]["OPT_BG"] thread doRainbow(true);
    }
}

MenuPreSetCol(Val,HUD,Bool)
{
    Size    = (HUD == "Banner" ? 1 : 0);
    SizeMax = (HUD == "Banner" ? 4 : 3);
    menu    = self getCurrentMenu();
    
    if(!IsDefined(Bool))
    {
        RGB = GetPresetColours(Val);
        for(e=Size;e<SizeMax;e++)
            if(IsDefined(self.sliders[menu + "_" + e]))
                self.sliders[menu + "_" + e] = undefined;
    }
    else
    {
        for(e=Size;e<SizeMax;e++)
            if(!IsDefined(self.sliders[menu+"_"+e]))
                self.sliders[menu + "_" + e] = 0;
        
        RGB = (HUD == "Banner" ? (self.sliders[menu + "_1"] / 255, self.sliders[menu + "_2"] / 255, self.sliders[menu+"_3"] / 255) : (self.sliders[menu + "_0"] / 255, self.sliders[menu + "_1"] / 255, self.sliders[menu + "_2"] / 255));
    }
   
    if(HUD == "Background")
    {
        self.menu["UI"]["OPT_BG"] notify("StopRainbow");
        self.menu["UI"]["OPT_BG"] thread fadeToColor(RGB, .5);
    }
        
    if(HUD == "Scroller")
    {
        self.menu["UI"]["SCROLL"] notify("StopRainbow");
        self.menu["UI"]["SCROLL"] thread fadeToColor(RGB, .5);
    }
        
    if(HUD == "Banner")
    {
        SliderCheck = self.menuSetting[HUD + (bool(self.menuSetting["HUDEdit"]) ? "NoneRainbow" : "GradRainbow")];
        
        if(bool(self.menuSetting["HUDEdit"]))
        {
            self.menu["UI"]["BGTitle"] notify("StopRainbow");
            self.menu["UI"]["BGTitle"] thread fadeToColor(RGB, .3);
        }
        else
        {
            self.menu["UI"]["BGTitle_Grad"] notify("StopRainbow");
            self.menu["UI"]["BGTitle_Grad"] thread fadeToColor(RGB, .3);
        }
        
        for(e=0;e<3;e++)
            self.menuSetting[HUD + (bool(self.menuSetting["HUDEdit"]) ? "NoneColor" : "GradColor") + e] = RGB[e];
            
        self.menuSetting[HUD + (bool(self.menuSetting["HUDEdit"]) ? "NoneRainbow" : "GradRainbow")] = (RGB[0],RGB[1],RGB[2]);
            
        return;
    }
    
    for(e=0;e<3;e++)
        self.menuSetting[HUD + "GradColor" + e] = RGB[e];
        
    self.menuSetting[HUD + "GradRainbow"] = (RGB[0],RGB[1],RGB[2]);
}

drawMenu()
{  
    numOpts = ((self.eMenu.size >= 8) ? 8 : self.eMenu.size);
    if(!isDefined(self.menu["UI"]))
        self.menu["UI"] = [];
    self.menu["UI"]["OPT_BG"] = self createRectangle("left", "top", 0, 90, 170, int(numOpts*15) + 45, self.menuSetting["BackgroundGradRainbow"], "white", 0, 1, true);
    self.menu["UI"]["OPT_BG"] affectElement("alpha", .2, .6);
    
    self.menu["UI"]["BGTitle"] = self createRectangle("left", "top", 0, 90, 170, 30, self.menuSetting["BannerNoneRainbow"], "white", 1, 1, true);
    self.menu["UI"]["BGTitle"] affectElement("alpha",.2,.6);
    
    self.menu["UI"]["BGTitle_Grad"] = self createRectangle("left", "top", 0, 90, 170, 30, self.menuSetting["BannerGradRainbow"], "white", 3, 0, true);
    self.menu["UI"]["BGTitle_Grad"] affectElement("alpha", .2, .6);
    
    self.menu["UI"]["CUR_TITLE"] = self createRectangle("left", "center", 0, -112, 170, 15, (0, 0, 0), "white", 4, 0, true);
    self.menu["UI"]["CUR_TITLE"] affectElement("alpha",.2, 1);
    
    self.menu["UI"]["SCROLL"] = self createRectangle("left", "top", 0, -5, 170, 16, self.menuSetting["ScrollerGradRainbow"], "white", 3, 0, true);
    self.menu["UI"]["SCROLL"] affectElement("alpha", .2, .6);
}

drawText()
{
    numOpts = ((self.eMenu.size >= 8) ? 8 : self.eMenu.size);
    if(!isDefined(self.menu["OPT"]))
        self.menu["OPT"] = [];
    if(!IsDefined(self.menu["OPT"]["OPTScroll"]))
        self.menu["OPT"]["OPTScroll"] = [];
    self.menu["OPT"]["TITLE"] = self createText("objective", 1.5, "CENTER", "TOP", -340, 95, 10, 0, "Synergy V3", (1, 1, 1), true);
    self.menu["OPT"]["TITLE"] affectElement("alpha",.4,1);
    
    self.menu["OPT"]["SUB_TITLE"] = self createText("objective", .75, "CENTER", "TOP", -340, 120, 10, 0, self.menuTitle, (1, 1, 1), true);
    self.menu["OPT"]["SUB_TITLE"] affectElement("alpha", .4, 1);
    
    self.menu["OPT"]["OPTSize"] = self createText("objective", .75, "center", "TOP", -270, 120, 10, 0, self getCursor() + 1 + "/" + self.eMenu.size, (1, 1, 1), true);
    self.menu["OPT"]["OPTSize"] affectElement("alpha",.4, 1);
    
    for(e=0;e<8;e++)
    {
        self.menu["OPT"][e] = self createText("objective", 1, "left", "TOP", 5, 132 + e*15, 4, 1, "", (1, 1, 1), true);
        self.menu["OPT"][e] affectElement("alpha",.4, 1);
    }

    self setMenuText();
}

setMenuText()
{
    ary = (self getCursor() >= 8 ? self getCursor()-7 : 0);
    for(e=0;e<8;e++)
    {
        if(IsDefined(self.menu["OPT"]["OPTScroll"][e]))
            self.menu["OPT"]["OPTScroll"][e] destroy();
        
        if(isDefined(self.menu["OPT"][e]))
        {
            self.menu["OPT"][e].color = ((isDefined(self.eMenu[ary + e].toggle) && self.eMenu[ary + e].toggle) ? (0, 1, 0) : (1, 1, 1));
            self.menu["OPT"][e] setText(self.eMenu[ary + e].opt);
        }
        if(IsDefined(self.eMenu[ary + e].val)){
            self.menu["OPT"]["OPTScroll"][e] = self createText("objective", 1, "center", "TOP", -285, 132 + e*15, 5, 1, "" + ((!isDefined(self.sliders[self getCurrentMenu() + "_" + (ary + e)])) ? self.eMenu[ary + e].val : self.sliders[self getCurrentMenu() + "_" + (ary + e)]), (1, 1, 1), true);
        }
        if(IsDefined(self.eMenu[ary + e].optSlide)){
            self.menu["OPT"]["OPTScroll"][e] = self createText("objective", 1, "center", "TOP", -285, 132 + e*15, 5, 1, ((!isDefined(self.Optsliders[self getCurrentMenu() + "_" + (ary + e)])) ? self.eMenu[ary + e].optSlide[0] + " [" + 1 + "/" + self.eMenu[ary + e].optSlide.size + "]" : self.eMenu[ary + e].optSlide[self.Optsliders[self getCurrentMenu() + "_" + (ary + e)]] + " [" + ((self.Optsliders[self getCurrentMenu() + "_" + (ary + e)])+1) + "/" + self.eMenu[ary + e].optSlide.size + "]"), (1, 1, 1), true);
		}
	}
}

resizeMenu()
{
    numOpts = ((self.eMenu.size >= 8) ? 8 : self.eMenu.size);
    self.menu["UI"]["OPT_BG"] setShader("white", 170, int(numOpts*15) + 45);
}

refreshTitle()
{
    self.menu["OPT"]["SUB_TITLE"] setText(self.menuTitle);
}

refreshOPTSize()
{
    self.menu["OPT"]["OPTSize"] setText(self getCursor() + 1 + "/" + self.eMenu.size);
}

menuMonitor()
{
    self endon("disconnect");
    self endon("end_menu");
    while(self.access != 0)
    {
        if(!self.menu["isLocked"])
        {
            if(!self.menu["isOpen"])
            {
                if(self meleeButtonPressed() && self adsButtonPressed())
                {
                    self menuOpen();
                    wait .2;
                }
            }
            else
            {
                if((self attackButtonPressed() || self adsButtonPressed()))
                {
                    CurrentCurs = self getCurrentMenu() + "_cursor";

                    self.menu[CurrentCurs]+= self attackButtonPressed();
                    self.menu[CurrentCurs]-= self adsButtonPressed();
                
                    self scrollingSystem();
                    self PlayLocalSound("mouse_over");
                    wait .2;
                }
            
                if(self FragButtonPressed() || self SecondaryOffhandButtonPressed())
                {
                    Menu = self.eMenu[self getCursor()];
                    if(self SecondaryOffhandButtonPressed())
                    {
                        if(IsDefined(Menu.optSlide))
                        {
                            self updateOptSlider("L2");
                            Func = self.Optsliders;
                        }
                        else if(IsDefined(Menu.val))
                        {
                            self updateSlider("L2");
                            Func = self.sliders;
                        }
                    }
                    if(self FragButtonPressed())
                    {
                        if(IsDefined(Menu.optSlide))
                        {
                            self updateOptSlider("R2");
                            Func = self.Optsliders;
                        }
                        else if(IsDefined(Menu.val))
                        {
                            self updateSlider("R2");
                            Func = self.sliders;
                        }
                    }

                    if(IsDefined(Menu.toggle))
                        self UpdateCurrentMenu();
                  
                    wait .12;
                }
            
                if(self useButtonPressed())
                {
                    Menu = self.eMenu[self getCursor()];
                    self PlayLocalSound("mouse_over");
                
                    if(IsDefined(self.sliders[self getCurrentMenu() + "_" + self getCursor()])){
                        slider = self.sliders[ self getCurrentMenu() + "_" + self getCursor() ];
                        slider = (IsDefined( menu.List1 ) ? menu.List1[slider] : slider);
                        self thread doOption(Menu.func, slider, Menu.p1, Menu.p2, Menu.p3,menu.p4,menu.p5);
                    }
                    else if(IsDefined(self.Optsliders[self getCurrentMenu() + "_" + self getCursor()]))
                        self thread doOption(Menu.func, self.Optsliders[self getCurrentMenu() + "_" + self getCursor()], Menu.p1, Menu.p2, Menu.p3);
                    
                    else
                        self thread doOption(Menu.func, Menu.p1, Menu.p2, Menu.p3, Menu.p4, Menu.p5, Menu.p6);
                    
                    if(IsDefined(Menu.toggle))
                        self UpdateCurrentMenu();
                    
                    wait .2;
                }
            
                if(self meleeButtonPressed())
                {
                    if(self getCurrentMenu() == "main")
                        self menuClose();
                    else
                        self newMenu();
                    
                    wait .2;
                }
            }
        }
        wait .05;
    }
}

doOption(func, p1, p2, p3, p4, p5, p6)
{
    if(!isdefined(func))
        return;
    if(isdefined(p6))
        self thread [[func]](p1,p2,p3,p4,p5,p6);
    else if(isdefined(p5))
        self thread [[func]](p1,p2,p3,p4,p5);
    else if(isdefined(p4))
        self thread [[func]](p1,p2,p3,p4);
    else if(isdefined(p3))
        self thread [[func]](p1,p2,p3);
    else if(isdefined(p2))
        self thread [[func]](p1,p2);
    else if(isdefined(p1))
        self thread [[func]](p1);
    else
        self thread [[func]]();
}

scrollingSystem()
{
    menu = self getCurrentMenu() + "_cursor";
    curs = self getCursor();
    if(curs >= self.eMenu.size || curs <0 || curs == 7 || curs >= 8)
    {
        if(curs <= 0)
            self.menu[menu] = self.eMenu.size -1;
            
        if(curs >= self.eMenu.size)
            self.menu[menu] = 0;
            
        self setMenuText();
    }
    self updateScrollbar();
    self refreshOPTSize();
}

updateScrollbar()
{
    curs = ((self getCursor() >= 8) ? 7 : self getCursor());
    self.menu["UI"]["SCROLL"].y = (self.menu["OPT"][0].y + (curs*15));
    if(IsDefined(self.eMenu[self getCursor()].val))
        self updateSlider();
        
    if(IsDefined(self.eMenu[self getCursor()].optSlide))
        self updateOptSlider();
    if(self getCurrentMenu() == "Clients")
        self.SavePInfo = level.players[self getCursor()];
}

newMenu(menu, Access)
{
    if(IsDefined(Access) && self.access < Access)
        return;
        
    if(!isDefined(menu))
    {
        menu = self.previousMenu[self.previousMenu.size-1];
        self.previousMenu[self.previousMenu.size-1] = undefined;
    }
    else
        self.previousMenu[self.previousMenu.size] = self getCurrentMenu();
    self setCurrentMenu(menu);    
    self menuOptions();
    self setMenuText();
    self refreshTitle();
    self resizeMenu();
    self UpdateCurrentMenu();
    self refreshOPTSize();
    self updateScrollbar();
}

isMenuOpen()
{
    if( !isDefined(self.menu["isOpen"]) || !self.menu["isOpen"] )
        return false;
    return true;
}

lockMenu(which)
{
    if(toLower(which) == "lock")
    {
        if(self isMenuOpen())
            self menuClose();
        self.menu["isLocked"] = true;
    }
    else if (toLower(which) == "unlock")
    {
        if(!self isMenuOpen())
            self menuOpen();
        self.menu["isLocked"] = false;
    }
}

addMenu(menu, title)
{
    self.storeMenu = menu;
    if(self getCurrentMenu() != menu)
        return;
    self.eMenu     = [];
    self.menuTitle = title;
    if(!isDefined(self.menu[menu + "_cursor"]))
        self.menu[menu + "_cursor"] = 0;
}

addOpt(opt, func, p1, p2, p3, p4, p5, p6)
{
    if(self.storeMenu != self getCurrentMenu())
        return;
    option      = spawnStruct();
    option.opt  = opt;
    option.func = func;
    option.p1   = p1;
    option.p2   = p2;
    option.p3   = p3;
    option.p4   = p4;
    option.p5   = p5;
    option.p6   = p6;
    self.eMenu[self.eMenu.size] = option;
}

addToggleOpt(opt, func, toggle, p1, p2, p3, p4, p5, p6)
{
    if(self.storeMenu != self getCurrentMenu())
        return;
    if(!IsDefined(toggle))
        toggle = false;
    toggleOpt        = spawnStruct();
    toggleOpt.opt    = opt;
    toggleOpt.func   = func;
    toggleOpt.toggle = (IsDefined(toggle) && toggle);
    toggleOpt.p1     = p1;
    toggleOpt.p2     = p2;
    toggleOpt.p3     = p3;
    toggleOpt.p4     = p4;
    toggleOpt.p5     = p5;
    toggleOpt.p6     = p6;
    self.eMenu[self.eMenu.size] = toggleOpt;
}

addSlider(opt, val, min, max, inc, func, toggle, autofunc, p1, p2, p3)
{
    if(self.storeMenu != self getCurrentMenu())
        return;
    if(!IsDefined(toggle))
        toggle = false;
    slider          = SpawnStruct();
    slider.opt      = opt;
    slider.val      = val;
    slider.min      = min;
    slider.max      = max;
    slider.inc      = inc;
    slider.func     = func;
    slider.toggle   = (IsDefined(toggle) && toggle);
    slider.autofunc = autofunc;
    slider.p1       = p1;
    slider.p2       = p2;
    slider.p3       = p3;
    self.eMenu[self.eMenu.size] = slider;
}

addOptSlider(opt, strTok, func, toggle, autofunc, p1, p2, p3)
{
    if(self.storeMenu != self getCurrentMenu())
        return;
    if(!IsDefined(toggle))
        toggle = false;
    Optslider          = SpawnStruct();
    Optslider.opt      = opt;
    Optslider.optSlide = strTok(strTok, "|");
    Optslider.func     = func;
    Optslider.toggle   = (IsDefined(toggle) && toggle);
    Optslider.autofunc = autofunc;
    Optslider.p1       = p1;
    Optslider.p2       = p2;
    Optslider.p3       = p3;
    self.eMenu[self.eMenu.size] = Optslider;
}

addSliderWithString(opt, List1, List2, func, p1, p2, p3, p4, p5)
{
    if(self.storeMenu != self getCurrentMenu())
        return;
    optionlist = spawnstruct();
    if(!isDefined(List2))
        List2 = List1;
    optionlist.List1 = (IsArray(List1)) ? List1 : strTok(List1, ";");
    optionlist.List2 = (IsArray(List2)) ? List2 : strTok(List2, ";");
    optionlist.opt = opt;
    optionlist.func = func;
    optionlist.p1   = p1;
    optionlist.p2   = p2;
    optionlist.p3   = p3;
    optionlist.p4   = p4;
    optionlist.p5   = p5;
    self.eMenu[self.eMenu.size] = optionlist;
}

updateSlider(pressed) 
{
    Menu = self.eMenu[self getCursor()];
    if(!IsDefined(self.sliders[self getCurrentMenu() + "_" + self getCursor()]))
        self.sliders[self getCurrentMenu() + "_" + self getCursor()] = self.eMenu[self getCursor()].val;
        
    curs = self.sliders[self getCurrentMenu() + "_" + self getCursor()];
    if(pressed == "R2")
        curs += Menu.inc;
    if(pressed == "L2")
        curs -= Menu.inc;
    if(curs > Menu.max)
        curs = Menu.min;
    if(curs < Menu.min)
        curs = Menu.max;
    
    
    cur = ((self getCursor() >= 8) ? 7 : self getCursor());
    if(curs != Menu.val)
        self.menu["OPT"]["OPTScroll"][cur] setText("" + curs);
    self.sliders[self getCurrentMenu() + "_" + self getCursor()] = curs;
}

updateOptSlider(pressed)
{
    Menu = self.eMenu[self getCursor()];
    
    if(!IsDefined(self.Optsliders[self getCurrentMenu() + "_" + self getCursor()]))
        self.Optsliders[self getCurrentMenu() + "_" + self getCursor()] = 0;
        
    curs = self.Optsliders[self getCurrentMenu() + "_" + self getCursor()];
    
    if(pressed == "R2")
        curs ++;
    if(pressed == "L2")
        curs --;               
    if(curs > Menu.optSlide.size-1)
        curs = 0;
    if(curs < 0)
        curs = Menu.optSlide.size-1;

    cur = ((self getCursor() >= 8) ? 7 : self getCursor());
    self.menu["OPT"]["OPTScroll"][cur] setText(Menu.optSlide[curs] + " [" + (curs+1) + "/" + Menu.optSlide.size + "]");
    self.Optsliders[self getCurrentMenu() + "_" + self getCursor()] = curs;
}

setCurrentMenu(menu)
{
    self.menu["current"] = menu;
}

getCurrentMenu()
{
    return self.menu["current"];
}

getCursor()
{
    return self.menu[self getCurrentMenu()+ "_cursor"];
}

hasMenu()
{
    return (isDefined(self.access) && self.access != 0 ? true : false);
}

UpdateCurrentMenu()
{
    self setCurrentMenu(self getCurrentMenu());
    self menuOptions();
    self setMenuText();
    self updateScrollbar();
    self resizeMenu();
    self refreshOPTSize();
}

menuOpen()
{
    ary = (self getCursor() >= 8 ? self getCursor()-7 : 0);
    self.menu["isOpen"] = true;
    if(bool(self.menuSetting["MenuFreeze"]))
        self FreezeControls(true);
    self menuOptions();
    self drawText();
    self drawMenu();
    self updateScrollbar();
    for(e=0;e<8;e++)
    {
        if(IsDefined(self.eMenu[ary + e].val) || IsDefined(self.eMenu[ary + e].optSlide))
        {
            self.menu["OPT"]["OPTScroll"][e].alpha = 0;
            self.menu["OPT"]["OPTScroll"][e] affectElement("alpha", .4, 1);
        }
    }
}

menuClose()
{
    self.menu["isOpen"] = false;
    if(bool(self.menuSetting["MenuFreeze"]))
        self FreezeControls(false);
    self destroyAll(self.menu["UI"]);
    self destroyAll(self.menu["OPT"]);
    self destroyAll(self.menu["OPT"]["OPTScroll"]);
}

onPlayerDisconnect(player)
{
    self notify("StopPMonitor");
    self endon("StopPMonitor");
    self endon("end_menu");
    self endon("disconnect");
    player waittill("disconnect");
    while(self getCurrentMenu() != "Clients")
        self newMenu();
    self setcursor(0, self getCurrentMenu());
    self UpdateCurrentMenu();
}

setcursor(value, menu)
{
    self.menu[menu + "_cursor"] = value;
}

menuOptions()
{    
    switch(self getCurrentMenu())
    {
        case "main":
            self addMenu("main", "Main Menu");
            self addOpt("Personal Modifications", ::newMenu, "Personal Modifications");
            if(self.access >= 1){//verified stuff
			self addOpt("Menu Customization", ::newMenu, "Menu Customisation", 1);
			self addOpt("Fate and Fortune Menu", ::newMenu, "Fate and Fortune", 1);
			self addOpt("Profile Manipulation", ::newMenu, "Profile Manipulation", 1);
            }
            if(self.access >= 2){
			self addOpt("Weapon Manipulation", ::newMenu, "Weapon Manipulation", 2);
			self addOpt("Lobby Manipulation", ::newMenu, "Lobby Manipulation", 2);
			self addOpt(GetTehMap()+" Options", ::newMenu, GetTehMap());
            }
            if (self.access >= 3){
            self addOpt("Clients [^2" + level.players.size + "^7]", ::newMenu, "Clients",4);
            self addOpt("All Clients", ::newMenu, "AllClients",4);
            }
            if(self IsHost()){ self addOpt("Host Debug Menu", ::newMenu, "Host Debug");}
            break;
        case "Personal Modifications":
            self addMenu("Personal Modifications", "Personal Modifications");
                self addToggleOpt("Toggle God Mode", ::Godmode, self.godmode);
                self addToggleOpt("Toggle Infinite Ammo", ::ToggleAmmo, self.UnlimAmmo);
                self addToggleOpt("Toggle Third Person", ::ThirdPersonToggle, self.ThirdPersonToggle);
            break;
		case "Menu Customisation":
			self addMenu("Menu Customisation", "Menu Customisation");
				self addOpt("Menu Colours", ::newMenu, "MenuColour");
				self addOpt("Reposition Menu", ::MoveMenu);
			break;
		case "MenuColour":
			self addMenu("MenuColour", "Menu Colours");
                self addOpt("Background", ::newMenu, "BackgroundColour");
                self addOpt("Banner", ::newMenu, "BannerColour");
                self addOpt("Scroller", ::newMenu, "ScrollerColour");
			break;
		case "BackgroundColour":
            self addMenu("BackgroundColour", "Menu Background");
                for(e=0;e<3;e++)
                    self addSlider(level.RGB[e] + " Slider", 0, 0, 255, 10, ::MenuPreSetCol, undefined, true, "Background", true);
                self addOptSlider("Colour Presets", GetColoursSlider(), ::MenuPreSetCol, undefined, true, "Background");
                self addToggleOpt("Rainbow Fade", ::MenuToggleRainbow, IsString(self.menuSetting["BackgroundGradRainbow"]), "Background");
            break;
            
        case "BannerColour":
            self addMenu("BannerColour", "Menu Banner");
                for(e=0;e<3;e++)
                    self addSlider(level.RGB[e] + " Slider", 0, 0, 255, 10, ::MenuPreSetCol, undefined, true, "Banner", true);
                self addOptSlider("Colour Presets", GetColoursSlider(),::MenuPreSetCol, undefined, true, "Banner");
                self addToggleOpt("Rainbow Fade", ::MenuToggleRainbow, bool(self.menuSetting["HUDEdit"]) ? IsString(self.menuSetting["BannerNoneRainbow"]) : IsString(self.menuSetting["BannerGradRainbow"]), "Banner");
            break;
            
        case "ScrollerColour":
            self addMenu("ScrollerColour", "Menu Scroller");
                for(e=0;e<3;e++)
                    self addSlider(level.RGB[e] + " Slider", 0, 0, 255, 10, ::MenuPreSetCol, undefined, true, "Scroller", true);
                self addOptSlider("Colour Presets", GetColoursSlider(), ::MenuPreSetCol, undefined, true, "Scroller");
                self addToggleOpt("Rainbow Fade", ::MenuToggleRainbow, IsString(self.menuSetting["ScrollerGradRainbow"]), "Scroller");
            break;
		case "Weapon Manipulation":
            self addMenu("Weapon Manipulation", "Weapon Manipulation");
                self addOpt("Weapon Selection", ::newMenu, "Weapon Selection");
				self addOpt("Fill Fate and Fortune", ::FillFAF);
            break;
        case "Weapon Selection":
            self addMenu("Weapon Selection", "Weapon Selection");
                for(e=0;e<level.WeaponCategories.size;e++)
                self addOpt(level.WeaponCategories[e], ::newMenu, level.WeaponCategories[e] );
            break;
        case "Assault Rifles":
            self addMenu(level.WeaponCategories[0], "Assault Rifles");
				for(i=0;i<level.ARNames.size;i++){
					self addOpt(level.ARNames[i], ::GiveWeaponToPlayer, level.Assault[i], self);
				}
            break;        
        case "Sub Machine Guns":
            self addMenu(level.WeaponCategories[1], "Sub Machine Guns");
				for(i=0;i<level.SMGNames.size;i++){
					self addOpt(level.SMGNames[i], ::GiveWeaponToPlayer, level.SMG[i], self);
				}
            break;
        case "Shotguns":
            self addMenu(level.WeaponCategories[4], "Shotguns");
				for(i=0;i<level.ShotgunNames.size;i++){
					self addOpt(level.ShotgunNames[i], ::GiveWeaponToPlayer, level.Shotguns[i], self);
				}
            break;
        case "Light Machine Guns":
            self addMenu(level.WeaponCategories[2], "Light Machine Guns");
				for(i=0;i<level.LMGNames.size;i++){
					self addOpt(level.LMGNames[i], ::GiveWeaponToPlayer, level.LMG[i], self);
				}
            break;
        case "Sniper Rifles":
            self addMenu(level.WeaponCategories[3], "Sniper Rifles");
                for(i=0;i<level.SniperNames.size;i++){
                    self addOpt( level.SniperNames[i], ::GiveWeaponToPlayer, level.Snipers[i], self ); 
				}
            break;
        case "Launchers":
            self addMenu(level.WeaponCategories[6], "Launchers");
                for(i=0;i<level.LauncherNames.size;i++){
                    self addOpt( level.LauncherNames[i], ::GiveWeaponToPlayer, level.Launchers[i], self ); 
				}
            break;
        case "Pistols":
            self addMenu(level.WeaponCategories[5], "Pistols");
                for(i=0;i<level.PistolNames.size;i++){
                    self addOpt( level.PistolNames[i], ::GiveWeaponToPlayer, level.Pistols[i], self );
					}
            break;
		case "Classic Weapons":
			self addMenu(level.WeaponCategories[7], "Classic Weapons");
				for(i=0;i<level.ClassicNames.size;i++){
					self addOpt(level.ClassicNames[i], ::GiveWeaponToPlayer, level.Classic[i], self);
				}
			break;
		case "Melee Weapons":
			self addMenu(level.WeaponCategories[8], "Melee Weapons");
			for(i=0;i<level.MeleeNames.size;i++){
				self addOpt(level.MeleeNames[i], ::GiveWeaponToPlayer, level.Melee[i], self);
			}
			break;
		case "Specialist Weapons":
			self addMenu(level.WeaponCategories[9], "Specialist Weapons");
				for(i=0;i<level.SpecialNames.size;i++){
					self addOpt(level.SpecialNames[i], ::GiveWeaponToPlayer, level.Specials[i], self);
				}
			break;
		case "Map Specific Weapons":
			self addMenu(level.WeaponCategories[10], "Map Specific Weapons");
				if(level.mapName == "cp_zmb"){
					for(i=0;i<level.SpacelandNames.size;i++){
						self addOpt(level.SpacelandNames[i], ::GiveWeaponToPlayer, level.SpacelandWeaps[i], self);
					}
				}
				else if(level.mapName == "cp_rave"){
					for(i=0;i<level.RaveNames.size;i++){
						self addOpt(level.RaveNames[i], ::GiveWeaponToPlayer, level.RaveWeaps[i], self);
					}
				}
				else if(level.mapName == "cp_disco"){
					for(i=0;i<level.ShaolinNames.size;i++){
						self addOpt(level.ShaolinNames[i], ::GiveWeaponToPlayer, level.ShaolinWeaps[i], self);
					}
				}
				else if(level.mapName == "cp_town"){
					for(i=0;i<level.AttackNames.size;i++){
						self addOpt(level.AttackNames[i], ::GiveWeaponToPlayer, level.AttackWeaps[i], self);
					}
				}
				else if(level.mapName == "cp_final")
				{
					for(i=0;i<level.BeastNames.size;i++){
						self addOpt(level.BeastNames[i], ::GiveWeaponToPlayer, level.BeastWeaps[i], self);
					}
				}
			break;
		case "Other Weapons":
			self addMenu(level.WeaponCategories[11], "Other Weapons");
				for(i=0;i<level.OtherNames.size;i++){
					self addOpt(level.OtherNames[i], ::GiveWeaponToPlayer, level.otherWeaps[i], self);
				}
			break;
		case "Zombies in Spaceland":
			self addMenu("Zombies in Spaceland", "Zombies in Spaceland");
				self addSlider("Give Tickets", 50,50,950, 50, ::GiveTickets);
				if(get_map_name() == "cp_zmb"){
				self addOpt("Trigger MW1 Song", ::PlayAudioToClients, "mus_pa_mw1_80s_cover");
				self addOpt("Trigger MW2 Song", ::PlayAudioToClients, "mus_pa_mw2_80s_cover");
				}
				self addOpt("Trigger MW2 Teddy", ::addTeddy);
			break;
		case "Rave in the Redwoods":
			self addMenu("Rave in the Redwoods", "Rave in the Redwoods");
				self addOpt("Play Puppet Strings", ::PlayAudioToClients, "mus_pa_rave_hidden_track");
			break;
		case "Shaolin Shuffle":
			self addMenu("Shaolin Shuffle", "Shaolin Shuffle");
				self addOpt("Play Beat of the Drum", ::PlayAudioToClients, "mus_pa_disco_hidden_track");
			break;

		case "Attack of the Radioactive Thing":
			self addMenu("Attack of the Radioactive Thing", "Attack of the Radioactive Thing");
				self addOpt("Play Brackyura boogie", ::PlayAudioToClients, "mus_pa_town_hidden_track");
				self addSlider("Complete EE Step", 0,0,12,1,::AttackEESteps);
			break;
        case "AllAccess":
            self addMenu("AllAccess", "Verification Level");
                for(e=0;e<level.Status.size-1;e++)
                    self addOpt(level.Status[e], ::AllPlayersAccess, e);
            break; 
        case "Host Debug":
            self addMenu("Host Debug", "Host Debug Settings");
                self addOpt("Fast Restart", ::FastRestartGame);
				self addSlider("Complete GnS Step", 0,0,6,1,::CompleteGnS);
				self addOpt("End The Game", ::EndGameHost);
				self addOpt("Turn on Power / Open Doors", ::OpenAllDoors);
				self addOpt("Map Selection", ::newMenu, "Map Selection");
				self addOpt("Max Bank Amount", ::MaxBank);
				self addOpt("Activate Reanimated", ::ActivateFAF, "self_revive", self);
            break;
		case "Map Selection":
			self addMenu("Map Selection", "Map Selection");
				self addOpt("Zombies in SpaceLand", ::ChangeMapFixed, "cp_zmb");
				self addOpt("Rave in the Redwoods", ::ChangeMapFixed, "cp_rave");
				self addOpt("Shaolin Shuffle", ::ChangeMapFixed, "cp_disco");
				self addOpt("Attack of the Radioactive Thing", ::ChangeMapFixed, "cp_town");
				self addOpt("The Beast From Beyond", ::ChangeMapFixed, "cp_final");
			break;
        default:
            self ClientOptions();
            break;
    }
}

ClientOptions()
{
    player = self.SavePInfo;
    Name   = player getName();
    switch(self getCurrentMenu())
    {
         case "Clients":
            self addmenu("Clients","Clients [^2" + level.players.size + "^7]");
            foreach(Client in level.players)
                self addopt(Client getName(), ::newmenu, "PMain");
            break;
            
        case "PMain":
            self addmenu("PMain", Name);
            self addOpt("Verification Level", ::newMenu, "PAccess");
            self addOpt("Personal Modifications", ::newMenu, "Personal Modifications Client");
            self addOpt("Stat Manipulation", ::newMenu, "Stat Manipulation Client");
            self addOpt("Trolling Options", ::newMenu, "Trolling Options");
            break;
		case "Personal Modifications Client":
			self addMenu("Personal Modifications Client", "Personal Modifications "+Name);
				self addToggleOpt("Toggle God Mode", ::ClientHandlerMain, player.godmode, 0, player);
				self addToggleOpt("Toggle Infinite Ammo", ::ClientHandlerMain, player.UnlimAmmo, 1, player);
			break;
        case "PAccess":
            self addMenu("PAccess", Name+" Verification");
            for(e=0;e<level.Status.size-1;e++)
                self addToggleOpt(GetAccessName(e), ::initializeSetup, player.access == e, e, player);
            break;
    }
}

Godmode() {
	self.Godmode = !return_toggle(self.Godmode);
	executeCommand("god");
	wait .01;
	if(self.Godmode) {
		self iPrintln("God Mode [^2ON^7]");
	} else {
		self iPrintlnAlt("God Mode [^1OFF^7]");
	}
}
GetTehMap()
{
	if(level.mapName == "cp_zmb") return "Zombies in Spaceland";
	if(level.mapName == "cp_rave") return "Rave in the Redwoods";
	if(level.mapName == "cp_disco") return "Shaolin Shuffle";
	if(level.mapName == "cp_town") return "Attack of the Radioactive Thing";
	if(level.mapName == "cp_final") return "Beast from Beyond";
}
GetTehMap2(mapName)
{
	if(mapName == "cp_zmb") return "Zombies in Spaceland";
	if(mapName == "cp_rave") return "Rave in the Redwoods";
	if(mapName == "cp_disco") return "Shaolin Shuffle";
	if(mapName == "cp_town") return "Attack of the Radioactive Thing";
	if(mapName == "cp_final") return "Beast from Beyond";
	else{ return "Undefined Map";}
}
ToggleAmmo() {
	self.UnlimAmmo = !return_toggle(self.UnlimAmmo);
	if(self.UnlimAmmo) {
		self iPrintln("Infinite Ammo [^2ON^7]");
		scripts\cp\utility::enable_infinite_ammo(self.UnlimAmmo);
	} else {
		self iPrintln("Infinite Ammo [^1OFF^7]");
		scripts\cp\utility::enable_infinite_ammo(self.UnlimAmmo);
		self notify("stop_infinite_ammo");
	}
	while (self.UnlimAmmo)
	{
		self setWeaponAmmoClip(self getCurrentWeapon(), 999);
		self setWeaponAmmoClip(self getCurrentWeapon(), 999, "left");
		self setWeaponAmmoClip(self getCurrentWeapon(), 999, "right");
		self scripts\cp\powers\coop_powers::power_adjustcharges(2, "primary", 2);
		self scripts\cp\powers\coop_powers::power_adjustcharges(2, "secondary", 2);
		wait .2;
	}
}

ThirdPersonToggle() {
	self.ThirdPersonToggle = !return_toggle(self.ThirdPersonToggle);
	if(self.ThirdPersonToggle) {
		self iPrintln("Third Person [^2ON^7]");
		setdvar("camera_thirdPerson", 1);
		scripts\cp\utility::setThirdPersonDOF(1);
	} else {
		self iPrintln("Third Person [^1OFF^7]");
		setdvar("camera_thirdPerson", 0);
		scripts\cp\utility::setThirdPersonDOF(0);
	}
}

FastRestartGame()
{
    map_restart(0);
}

welcomeMessage(message, message2) {
    if (isDefined(self.welcomeMessage))
        while (1) {
            wait .05;
            if (!isDefined(self.welcomeMessage))
                break;
        }
    self.welcomeMessage = true;

    hud = [];
    hud[0] = self createText("default", 1.35, "CENTER", "CENTER", 0, -140 + 60, 10, 1, message);
    hud[1] = self createText("default", 1.35, "CENTER", "CENTER", 0, -120 + 60, 10, 1, message2);

    hud[0] thread hudMoveX(-25, .35);
    hud[1] thread hudMoveX(25, .35);
    wait .35;

    hud[0] thread hudMoveX(25, 3);
    hud[1] thread hudMoveX(-25, 3);
    wait 3;

    hud[0] thread hudMoveX(500, .35);
    hud[1] thread hudMoveX(-500, .35);
    wait .35;

    self destroyAll(hud);
    self.welcomeMessage = undefined;
}

ClientHandlerMain(func, client)
{
	switch(func){
		case 0: client thread Godmode(); break;
		case 1: client thread ToggleAmmo(); break;
	}
}


GiveWeaponToPlayer(weapon, player) {
	if(player getCurrentWeapon() != weapon && player getWeaponsListPrimaries()[1] != weapon && player getWeaponsListPrimaries()[2] != weapon && player getWeaponsListPrimaries()[3] != weapon&& player getWeaponsListPrimaries()[4] != weapon) {
		if(player scripts\cp\utility::has_zombie_perk("perk_machine_more")) {
			max_weapon_num = 4;
		} else {
			max_weapon_num = 3;
		}
		if(player getWeaponsListPrimaries().size >= max_weapon_num) {
			player takeWeapon(player getCurrentWeapon());
		}
		
		if(weapon == "iw7_spaceland_wmd" || weapon == "iw7_fists_zm" || weapon == "iw7_entangler_zm" || weapon == "iw7_atomizer_mp" || weapon == "iw7_penetrationrail_mp+penetrationrailscope" || weapon == "iw7_steeldragon_mp" || weapon == "iw7_claw_mp" || weapon == "iw7_blackholegun_mp+blackholegunscope" || weapon == "iw7_cutie_zm") {
			player giveWeapon(weapon);
			player switchToWeapon(weapon);
			wait 1;
			player setWeaponAmmoClip(player getCurrentWeapon(), 999);
			player setWeaponAmmoClip(player getCurrentWeapon(), 999, "left");
			player setWeaponAmmoClip(player getCurrentWeapon(), 999, "right");
			
		} else {
			player giveWeapon(return_weapon_name_with_like_attachments(weapon));
			player switchToWeapon(return_weapon_name_with_like_attachments(weapon));
			wait 1;
			player setWeaponAmmoClip(player getCurrentWeapon(), 999);
			player setWeaponAmmoClip(player getCurrentWeapon(), 999, "left");
			player setWeaponAmmoClip(player getCurrentWeapon(), 999, "right");
		}
	} else {
		player switchToWeaponImmediate(return_weapon_name_with_like_attachments(weapon));
		wait 1;
		player setWeaponAmmoClip(player getCurrentWeapon(), 999);
		player setWeaponAmmoClip(player getCurrentWeapon(), 999, "left");
		player setWeaponAmmoClip(player getCurrentWeapon(), 999, "right");
	}
}

build_custom_weapon(weapon, camo, extra_attachments) {
	weapon_name = scripts\cp\utility::getrawbaseweaponname(weapon);
	
	if (isDefined(self.weapon_build_models[weapon_name])) {
		weapon_model = self.weapon_build_models[weapon_name];
		weapon_attachments = getweaponattachments(weapon_model);
		weapon_build = scripts\engine\utility::array_combine(extra_attachments, weapon_attachments);
		weapon_custom = self scripts\cp\cp_weapon::return_weapon_name_with_like_attachments(getweaponbasename(weapon), undefined, weapon_build, 1, camo);
		return weapon_custom;
	} else {
		weapon_custom = scripts\engine\utility::array_combine(extra_attachments, weapon);
		return weapon_custom;
	}
}

take_weapon(weapon_name) {
	self takeWeapon(self getCurrentWeapon());
	self switchToWeapon(self getWeaponsListPrimaries()[1]);
}

GiveTickets(Amount)
{
	scripts\cp\zombies\arcade_game_utility::give_player_tickets(self, Amount);
	self iPrintLnBold("Awarded ^1"+amount+" Tickets");
}

CompleteGnS(step)
{
	scripts\cp\maps\cp_zmb\cp_zmb_ghost_wave::notify_activation_progress(step);
}

EndGameHost()
{
	level notify("game_ended");
    foreach(client in level.players) client iPrintLnBold("^2Sorry, "+level.hostname+" Ended The Game");
}

OpenAllDoors()
{
	scripts\cp\zombies\direct_boss_fight::open_sesame();
}
addTeddy(){
	level.toys_found++;
}

ChangeMapFixed(MapName)
{
self iprintlnbold("^5Map Name Being Changed To ^2"+GetTehMap2(MapName)+"!");
wait 0.50;
setDvar("ls_mapname", MapName);
setDvar("mapname", MapName);
setDvar("party_mapname", MapName);
setDvar("ui_mapname", MapName);
setDvar("ui_currentMap", MapName);
setDvar("ui_mapname", MapName);
setDvar("ui_preview_map", MapName);
setDvar("ui_showmap", MapName);
ExecuteCommand("map "+MapName);
}

MaxBank()
{
	level.atm_amount_deposited = 2147483647;
	self scripts\cp\cp_vo::try_to_play_vo("atm_deposit","zmb_comment_vo","low",10,0,0,1,40);
	self iPrintLnBold("The Bank is ^2BURSTING! ^0Balance Set to: ^2$2147483647");
}

//////////////////////////////////////////////////////////////IW7 Script, Taken from cp_zmb.gsc


////////////////////////////////////////////////////////END IW7 SCRIPT

spawnEnemyType(enemyType, team) {
	if(enemyType == "zombie_grey") {
		weapon = "iw7_zapper_grey";
	} else if(enemyType == "the_hoff" || enemyType == "elvira") {
		weapon = "iw7_ake_zmr+akepap2";
	} else {
		weapon = undefined;
	}
	scripts\mp\mp_agent::spawnNewAgent(enemyType, team, self.origin + anglesToForward(self.angles) * 200, self.angles, weapon);
}

killAllZombies()
{
    level notify("restart_round");
    zombies = scripts\cp\cp_agent_utils::getAliveAgentsOfTeam("axis");
    if(isdefined(zombies))
    {
        for(i = 0; i < zombies.size; i++)
            zombies[i] DoDamage(zombies[i].health + 1, zombies[i].origin);
    }
	self iPrintLnBold("All Zombies ^2Killed");
}

PlayAudioToClients(audioFile)
{
	foreach(player in level.players)
	{
		player scripts\cp\zombies\zombie_jukebox::force_song((649,683,254),audioFile);
	}
}

FillFAF()
{
	self setclientomnvar("zm_dpad_up_fill",self.consumable_meter_max);
}

ActivateFAF(card,player)
{
	if(card == "irish_luck") 
	{
		scripts\cp\zombies\zombies_consumables::consumable_activate_internal(999,"zm_card"+card+1+"_drain","zm_dpad_up_uses","zm_dpad_up_activated", "slot_"+card+1+"_used",card,player);
		return;
	}
	scripts\cp\zombies\zombies_consumables::consumable_activate_internal(999,"zm_card"+card+1+"_drain","zm_dpad_up_uses","zm_dpad_up_activated", "slot_" + card + 1 + "_used",card,player);
}

AttackEESteps(step)
{
	switch(step)
	{
		case 1:
			foreach(bodypart in level.mpq_zom_body_parts)
			{
				set_quest_omnvar_by_targetname(bodypart);
				bodypart hide();
				wait(0.1);
			}

			level.leg_knocked_down = 1;
			var_03 = getent("mpq_zom_l_leg_part_ground","targetname");
			if(isdefined(var_03))
			{
				var_03 hide();
			}

			foreach(var_05, var_01 in level.mpq_zom_parts)
			{
				if(!isdefined(var_01.fx_ent))
				{
					level thread glow_bed_part(var_05,var_01);
				}

				var_01 show();
				wait(0.1);
			}

			level.mpq_zom_parts_picked_up["head"] = 1;
			level.mpq_zom_parts_picked_up["torso"] = 1;
			level.mpq_zom_parts_picked_up["left_arm"] = 1;
			level.mpq_zom_parts_picked_up["right_arm"] = 1;
			level.mpq_zom_parts_picked_up["left_leg"] = 1;
			level.mpq_zom_parts_picked_up["right_leg"] = 1;
			level.mpq_zom_parts_index = level.mpq_zom_parts_picked_up.size;
			break;
		case 2:
			punchCard = getent("mpq_punch_card","targetname");
			punchCard hide();
			set_quest_omnvar_by_targetname("mpq_punch_card");
			level.punch_card_acquired = 1;
			break;
		case 3:
			var_00 = getent("elvira_mirror","targetname");
			var_00 hide();
			level.mirrors_picked_up["elvira_mirror"] = 1;
			set_quest_omnvar_by_targetname(var_00);
			var_00 = getent("car_mirror","targetname");
			var_00 hide();
			var_00 = getent("car_mirror_ground","targetname");
			var_00 hide();
			level.mirrors_picked_up["car_mirror_ground"] = 1;
			set_quest_omnvar_by_targetname(var_00);
			var_00 = getent("bathroom_mirror_piece","targetname");
			var_00 hide();
			level.mirrors_picked_up["bathroom_mirror_piece"] = 1;
			set_quest_omnvar_by_targetname(var_00);
			var_01 = scripts\engine\utility::getstructarray("mirror_placement","script_noteworthy");
			foreach(var_03 in var_01)
			{
				var_04 = scripts\engine\utility::getstruct(var_03.target,"targetname");
				var_00 = spawn("script_model",var_04.origin);
				var_00.angles = var_04.angles;
				var_00 setmodel(var_04.script_noteworthy);
			}

			level.mirrors_placed["car_mirror"] = 1;
			level.mirrors_placed["bathroom_mirror"] = 1;
			level.mirrors_placed["elvira_mirror"] = 1;
			break;
		case 4:
			foreach(var_01 in level.mpq_zom_parts)
			{
				var_01 hide();
			}

			level.knife_throw_target_body show();
			level.body_made = 1;
			level.terminal_unlocked = 1;
			break;
		case 5: level.polarity_reversed = 1; break;
		case 6: level.knife_throw_target_body hide();
				spawn_garage_key(level.knife_throw_target_body.origin);
				level.key_spawned = 1;
				break;
	}
}

set_quest_omnvar_by_targetname(param_00)//required for Attack EE Step
{
	var_01 = 0;
	switch(param_00.var_336)
	{
		case "mpq_zom_head_part":
			var_01 = 1;
			break;

		case "mpq_zom_torso_part":
			var_01 = 6;
			break;

		case "mpq_zom_l_arm_part":
			var_01 = 2;
			break;

		case "mpq_zom_r_arm_part":
			var_01 = 3;
			break;

		case "mpq_zom_l_leg_part":
			var_01 = 4;
			break;

		case "mpq_zom_r_leg_part":
			var_01 = 5;
			break;

		case "mpq_punch_card":
			var_01 = 10;
			break;

		case "car_mirror_ground":
		case "mirror":
			var_01 = 7;
			break;

		case "elvira_mirror":
			var_01 = 8;
			break;

		case "bathroom_mirror_piece":
			var_01 = 9;
			break;
	}

	if(var_01 > 0)
	{
		scripts\cp\utility::set_quest_icon(var_01);
	}
}

glow_bed_part(param_00,param_01)//Required for Attack EE
{
	param_01.fx_ent = spawn("script_model",param_01.origin);
	switch(param_00)
	{
		case "torso":
			param_01.fx_ent.origin = param_01.fx_ent.origin + (17,-17,50);
			param_01.fx_ent_2 = spawn("script_model",param_01.origin);
			param_01.fx_ent_2.origin = param_01.fx_ent_2.origin + (12,-12,35);
			param_01.fx_ent_2 setmodel("tag_origin_limb_glow_fx");
			break;

		case "head":
			param_01.fx_ent.origin = param_01.fx_ent.origin + (2,-2,15);
			break;

		case "left_arm":
			param_01.fx_ent.origin = param_01.fx_ent.origin + (-9,-9,3);
			break;

		case "right_arm":
			param_01.fx_ent.origin = param_01.fx_ent.origin + (8,8,6);
			break;

		case "left_leg":
			param_01.fx_ent.origin = param_01.fx_ent.origin + (-17,-5,-5);
			break;

		case "right_leg":
			param_01.fx_ent.origin = param_01.fx_ent.origin + (-5,10,-5);
			break;
	}

	param_01.fx_ent setmodel("tag_origin_limb_glow_fx");
}

spawn_garage_key(param_00)//Required for Attack EE
{
	level.key_fx = spawnfx(level._effect["locker_key"],param_00 + (0,0,32));
	wait(0.2);
	triggerfx(level.key_fx);
}
