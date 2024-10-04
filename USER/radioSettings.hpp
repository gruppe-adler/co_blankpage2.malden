/*
*   Definiert voreingestellte Funkfrequenzen und Netznamen.
*   Netzname ist optional und wird, sofern vorhanden, bei Spielstart am Kartenrand vermerkt.
*
*   Die ersten 8 Shortrange Netze werden auf den SR Kanälen 1-8 und die ersten 9 Longrange Netze werden auf den LR Kanälen 1-9 voreingestellt.
*   Es können weitere Netze definiert werden, die dann in der groupsettings.hpp einzelnen Gruppen zugewiesen werden können.
*
*   Beispiel:
    class net1 {
        freq = 32.5;
        name = "Command Kanal";
    };

    //[...]

    class net10 {
        freq = 80.1;
        name = "Air Intern";
    };
*/

class CfgRadio
{
	sounds[] = {};
	class krakenMsg1
	{
		// display name
		name	= "krakenMsg1";

		// filename, volume, pitch
		sound[]	= { "\sound\filename1.ogg", db - 100, 1.0 };

		// radio caption
		title	= "Kraken, New directives. 
        The submarine is compromised, and its contents pose a security risk. Your mission is as follows: 
        Retrieve the blackbox and transport it to Outpost Delphi [Coordinates marked on map] for extraction. 
        Destroy the submarine—plant charges and ensure no evidence of external involvement. 
        Eliminate any civilian witnesses—all nearby individuals are considered compromised.
        Maintain radio silence until you arrive at the outpost.
        Discretion is paramount. Eliminate all traces and secure the asset. Mission failure is not an option.
        Command out.";
	};

	class RadioMsg2
	{
		name	= "";
		sound[]	= { "\sound\filename2", db - 100, 1.0 }; // .wss implied
		title	= "$STR_RADIO_2";
	};
};


//SHORTRANGE KANÄLE ============================================================
class shortrange {
    class net1 {
        freq = 50;
    };

    class net2 {
        freq = 60;
    };

    class net3 {
        freq = 70;
    };

    class net4 {
        freq = 80;
    };

    class net5 {
        freq = 90;
    };

    class net6 {
        freq = 100;
    };

    class net7 {
        freq = 110;
    };

    class net8 {
        freq = 120;
    };
};


//LONGRANGE KANÄLE =============================================================
class longrange {
    class net1 {
        freq = 32;
    };

    class net2 {
        freq = 33;
    };

    class net3 {
        freq = 34;
    };

    class net4 {
        freq = 35;
    };

    class net5 {
        freq = 36;
    };

    class net6 {
        freq = 37;
    };

    class net7 {
        freq = 38;
    };

    class net8 {
        freq = 39;
    };

    class net9 {
        freq = 40;
    };
};
