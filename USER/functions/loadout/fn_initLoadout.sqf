private ["_currentLoadout", "_currentLoadoutType", "_diveLoadout", "_normalLoadout"];

switch (typeOf player) do {
	// SEAWATCH SQL
	case "B_T_Diver_TL_F": {
		_diveLoadout = [["arifle_SDAR_F","","","",["20Rnd_556x45_UW_mag",20],[],""],[],[],["U_B_Wetsuit",[["ACE_tourniquet",4],["ACE_packingBandage",10],["ACE_elasticBandage",10],["ACE_salineIV_500",1],["ACE_morphine",2],["ACE_quikclot",10],["20Rnd_556x45_UW_mag",8,20]]],["V_RebreatherB",[]],[],"","G_B_Diving",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","TFAR_anprc152","ItemCompass","ItemWatch",""]];
		_normalLoadout = [["rhs_weap_m16a4_imod_M203","","","rhsusf_acc_eotech_552",["30Rnd_556x45_Stanag",30],["1Rnd_HE_Grenade_shell",1],""],[],[],["rhs_uniform_acu_ucp",[["ACE_packingBandage",15],["ACE_elasticBandage",15],["ACE_quikclot",10],["ACE_morphine",2],["ACE_salineIV_500",1],["ACE_tourniquet",4]]],["rhsusf_iotv_ucp_Teamleader",[["30Rnd_556x45_Stanag_Tracer_Yellow",15,30],["rhs_mag_an_m8hc",2,1],["rhs_mag_m67",1,1]]],["TFAR_mr3000_bwmod_tropen",[["rhs_mag_M441_HE",10,1],["rhs_mag_m714_White",10,1]]],"rhsusf_ach_helmet_ucp","G_B_Diving",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","TFAR_anprc152","ItemCompass","ItemWatch",""]];
		_currentLoadoutType = "NORMAL";
		_currentLoadout = _nomalLoadout
	};
	// SEAWATCH Rescue Diver
	case "B_T_Diver_F": {
		_diveLoadout = [["arifle_SDAR_F","","","",["20Rnd_556x45_UW_mag",20],[],""],[],[],["U_B_Wetsuit",[["ACE_tourniquet",4],["ACE_packingBandage",10],["ACE_elasticBandage",10],["ACE_salineIV_500",1],["ACE_morphine",2],["ACE_quikclot",10],["20Rnd_556x45_UW_mag",8,20]]],["V_RebreatherB",[]],[],"","G_B_Diving",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","TFAR_anprc152","ItemCompass","ItemWatch",""]];
		_normalLoadout = [["rhs_weap_m16a4","","","rhsusf_acc_eotech_552",["30Rnd_556x45_Stanag",30],[],""],[],[],["rhs_uniform_acu_ucp",[["ACE_packingBandage",15],["ACE_elasticBandage",15],["ACE_quikclot",10],["ACE_morphine",2],["ACE_salineIV_500",1],["ACE_tourniquet",4]]],["rhsusf_iotv_ucp_Teamleader",[["rhs_mag_an_m8hc",2,1],["rhs_mag_m67",1,1],["30Rnd_556x45_Stanag_Tracer_Yellow",15,30]]],[],"rhsusf_ach_helmet_ucp","G_B_Diving",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","TFAR_anprc152","ItemCompass","ItemWatch",""]];
		_currentLoadoutType = "NORMAL";
		_currentLoadout = _nomalLoadout
	};
	// KRAKEN Sepcial Forces Diver
	case "B_diver_F": {		
		_diveLoadout = [["arifle_SDAR_F","","","",["20Rnd_556x45_UW_mag",20],[],""],[],[],["U_I_Wetsuit",[["ACE_tourniquet",4],["ACE_packingBandage",10],["ACE_elasticBandage",10],["ACE_salineIV_500",1],["ACE_morphine",2],["ACE_quikclot",10],["20Rnd_556x45_UW_mag",8,20]]],["V_RebreatherIA",[]],["B_Messenger_Black_F",[["ACE_DefusalKit",1],["ACE_M26_Clacker",1],["SatchelCharge_Remote_Mag",1,1]]],"","G_I_Diving",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","TFAR_anprc152","ItemCompass","ItemWatch",""]];
		_normalLoadout = [["rhs_weap_hk416d145","rhsusf_acc_nt4_black","","rhsusf_acc_eotech_xps3",["30Rnd_556x45_Stanag_Tracer_Green",30],[],""],[],["hgun_Pistol_heavy_01_F","muzzle_snds_acp","","optic_MRD",["11Rnd_45ACP_Mag",15],[],""],["rhs_uniform_g3_blk",[["ACE_elasticBandage",20],["ACE_packingBandage",20],["ACE_tourniquet",4],["ACE_morphine",2],["ACE_salineIV_500",1],["ACE_MapTools",1]]],["V_PlateCarrier2_blk",[["30Rnd_556x45_Stanag_green",11,30],["rhs_mag_an_m8hc",2,1],["rhs_mag_m67",2,1],["11Rnd_45ACP_Mag",2,15]]],[],"rhsusf_opscore_bk_pelt","G_I_Diving",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","TFAR_anprc152","ItemCompass","ItemWatch",""]];
		_currentLoadoutType = "NORMAL";
		_currentLoadout = _nomalLoadout
	};
	default { };
};