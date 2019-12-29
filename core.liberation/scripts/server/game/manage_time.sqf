private [ "_accelerated_time" ];

while { true } do {
	_accelerated_time = GRLIB_time_factor;

	if ( GRLIB_shorter_nights && (daytime > GRLIB_nights_start || daytime < GRLIB_nights_stop)) then {
		_accelerated_time = 20;
	};

	if ( GRLIB_shorter_nights && (daytime > GRLIB_nights_start + 2 || daytime < GRLIB_nights_stop - 2)) then {
		_accelerated_time = 60;
	};

	setTimeMultiplier _accelerated_time;
	{
	  	if ( (!isDamageAllowed _x && lifeState _x == 'HEALTHY' && GRLIB_endgame == 0) || _x getVariable ["godmode", 0] == 1) then {
		  	_x forceAddUniform "U_B_Protagonist_VR";
			_x allowDamage false;
			_x setDamage 0;
		};
	} forEach AllPlayers;
	sleep 10;
};
