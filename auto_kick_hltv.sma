#include <amxmodx>

#pragma semicolon 1

const KICK_DELAY = 20; // auto kick delay in minutes (default: 20)

// #define HLTV_CLIENTS_ALLOWED // uncomment this line if HLTV clients allowed on server
// #define USE_LOGGING // uncomment this line if you want use logging

#if defined HLTV_CLIENTS_ALLOWED
	new const HLTV_IP[] = "127.0.0.1:27020"; // HLTV server IP (change it; default: "127.0.0.1:27020")
#endif

new g_UserId;

public plugin_init() {
	register_plugin("Auto Kick HLTV", "0.3", "Subb98");
}

public client_putinserver(id) {
	if(!is_user_hltv(id)) {
		return;
	}

	#if defined HLTV_CLIENTS_ALLOWED
	new IP[22];
	get_user_ip(id, IP, charsmax(IP));

	if(!equal(IP, HLTV_IP)) {
		return;
	}
	#endif

	g_UserId = get_user_userid(id);
	set_task(KICK_DELAY * 60.0, "KickHLTV", id);
}

public client_disconnect(id) {
	if(get_user_userid(id) == g_UserId) {
		remove_task(id);
	}
}

public KickHLTV(const id) {
	server_cmd("kick #%d", g_UserId);

	#if defined USE_LOGGING
	log_amx("HLTV <%s> has been kicked automatically", g_UserId);
	#endif
}
