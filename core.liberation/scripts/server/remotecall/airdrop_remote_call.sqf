if (!isServer) exitWith {};
params [ "_unit", "_class" ];
{
	_dist = round (_unit distance2D _x);
	if (_dist <= 500) then {["parasound"] remoteExec ["playSound", owner _x]};
} forEach allPlayers;

_pos = (getPosATL _unit) vectorAdd [0, 0, 400];
_veh = createVehicle [_class, _pos, [], 0, "NONE"];
_veh setdir (random 360);
_text = format ["Player %1 call Air Support.  Dropping: %2 !", name _unit, getText (configFile >> "CfgVehicles" >> typeOf _veh >> "displayName")];
[gamelogic, _text] remoteExec ["globalChat", 0];
[_unit] remoteExec ["remote_call_airdrop", owner _unit];
[_veh, objNull] spawn F_addParachute;
