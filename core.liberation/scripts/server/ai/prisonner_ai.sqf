params [ "_unit", ["_force_surrender", false] ];

if ( (!_force_surrender) && (( random 100 ) > GRLIB_surrender_chance) ) exitWith {};

if ( (_unit isKindOf "Man") && ( alive _unit ) && (side group _unit == GRLIB_side_enemy) && (!(_unit getVariable ['mission_AI', false])) ) then {

	if ( vehicle _unit != _unit ) then { deleteVehicle _unit };

	sleep (random 5);

	if ( alive _unit ) then {

		removeAllWeapons _unit;
		if(typeof _unit != pilot_classname) then {
			removeHeadgear _unit;
		};
		removeBackpack _unit;
		removeVest _unit;
		_unit unassignItem "NVGoggles_OPFOR";
		_unit removeItem "NVGoggles_OPFOR";
		_unit unassignItem "NVGoggles_INDEP";
		_unit removeItem "NVGoggles_INDEP";
		_unit setUnitPos "UP";
		sleep 1;
		_unit disableAI "ANIM";
		_unit disableAI "MOVE";
		_unit playmove "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon" ;
		sleep 2;
		_unit setCaptive true;
 		_unit setVariable ["GRLIB_is_prisonner", true, true];
		waitUntil { sleep 1;
			!alive _unit || side group _unit == GRLIB_side_friendly
		};

		if ( alive _unit ) then {
			_unit enableAI "ANIM";
			_unit enableAI "MOVE";
			sleep 1;
			[ [ _unit ], "remote_call_prisonner", _unit ] call bis_fnc_mp;
		};
	};
};