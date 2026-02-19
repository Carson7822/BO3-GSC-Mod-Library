#using scripts\codescripts\struct;

//WW2 power switch
#using scripts\fanatic\ww2\ww2_power_switch;

#using scripts\shared\array_shared;
#using scripts\shared\callbacks_shared;
#using scripts\shared\clientfield_shared;
#using scripts\shared\compass;
#using scripts\shared\exploder_shared;
#using scripts\shared\flag_shared;
#using scripts\shared\laststand_shared;
#using scripts\shared\math_shared;
#using scripts\shared\scene_shared;
#using scripts\shared\util_shared;

#insert scripts\shared\shared.gsh;
#insert scripts\shared\version.gsh;

#insert scripts\zm\_zm_utility.gsh;

#using scripts\zm\_load;
#using scripts\zm\_zm;
#using scripts\zm\_zm_audio;
#using scripts\zm\_zm_powerups;
#using scripts\zm\_zm_utility;
#using scripts\zm\_zm_weapons;
#using scripts\zm\_zm_zonemgr;

#using scripts\shared\ai\zombie_utility;

//Perks
#using scripts\zm\_zm_pack_a_punch;
#using scripts\zm\_zm_pack_a_punch_util;
#using scripts\zm\_zm_perk_additionalprimaryweapon;
#using scripts\zm\_zm_perk_doubletap2;
#using scripts\zm\_zm_perk_deadshot;
#using scripts\zm\_zm_perk_juggernaut;
#using scripts\zm\_zm_perk_quick_revive;
#using scripts\zm\_zm_perk_sleight_of_hand;
#using scripts\zm\_zm_perk_staminup;
#using scripts\zm\_zm_perk_electric_cherry;
#using scripts\zm\_zm_perk_widows_wine;
#using scripts\zm\_zm_perk_phdflopper;
#using scripts\zm\_zm_perk_elemental_pop;
#using scripts\zm\_zm_perk_random;
#using scripts\zm\logical\perks\_zm_perk_ffyl;
#using scripts\zm\logical\perks\_zm_perk_icu;
#using scripts\zm\logical\perks\_zm_perk_tactiquilla;
#using scripts\zm\logical\perks\_zm_perk_milk;

//Powerups
#using scripts\zm\_zm_powerup_double_points;
#using scripts\zm\_zm_powerup_carpenter;
#using scripts\zm\_zm_powerup_fire_sale;
#using scripts\zm\_zm_powerup_free_perk;
#using scripts\zm\_zm_powerup_full_ammo;
#using scripts\zm\_zm_powerup_insta_kill;
#using scripts\zm\_zm_powerup_nuke;
//#using scripts\zm\_zm_powerup_weapon_minigun;

//mystery boxes
#using scripts\zm\_hb21_zm_magicbox;

//Traps
#using scripts\zm\_zm_trap_electric;

#using scripts\zm\zm_usermap;

//Console Commands
#using scripts\Sphynx\commands\_zm_commands;
#using scripts\Sphynx\commands\_zm_name_checker;

//scripts
#using scripts\zm\zm_eefs_dungeon_scripts;

//HITMARKERS
#using scripts\zm\_hb21_zm_hitmarkers;

//*****************************************************************************
// MAIN
//*****************************************************************************

function main()
{
	zm_usermap::main();

	//WW2 Power Switch
	ww2_power_switch::init();

	// Change Starting Weapon
	 startingWeapon = "t6_m1911";
	 weapon = getWeapon(startingWeapon);
	 level.start_weapon = (weapon);


	//perk limit
	level.perk_purchase_limit = 30;

	//bo4 knife
	zm_utility::register_melee_weapon_for_level( "t8_knife" );
	level.weaponbasemelee = getweapon("t8_knife");
	
	level._zombie_custom_add_weapons =&custom_add_weapons;
	
	//Setup the levels Zombie Zone Volumes
	level.zones = [];
	level.zone_manager_init_func =&usermap_test_zone_init;
	init_zones[0] = "start_zone";
	level thread zm_zonemgr::manage_zones( init_zones );

	level.pathdist_type = PATHDIST_ORIGINAL;
	thread iceGrenade_autoZones();
}

function usermap_test_zone_init()
{
	level flag::init( "always_on" );
	level flag::set( "always_on" );
	zm_zonemgr::add_adjacent_zone( "start_zone", "zone_2", "activate_zone_2");
	zm_zonemgr::add_adjacent_zone( "zone_2", "zone_3", "activate_zone_3");
	zm_zonemgr::add_adjacent_zone( "zone_2", "zone_4", "activate_zone_4");
	zm_zonemgr::add_adjacent_zone( "zone_4", "zone_5", "activate_zone_5");
	zm_zonemgr::add_adjacent_zone( "zone_3", "zone_6", "activate_zone_6");
}	

function custom_add_weapons()
{
	zm_weapons::load_weapon_spec_from_table("gamedata/weapons/zm/zm_levelcommon_weapons.csv", 1);
}

function iceGrenade_autoZones()
{
    //One thread below for each trigger
    thread triggerZone("activate_zone_2");
}

    
   function triggerZone(ztarg)
{
    runit = GetEnt( ztarg, "targetname");
    runit waittill("trigger", player);
    level flag::set( ztarg );
}