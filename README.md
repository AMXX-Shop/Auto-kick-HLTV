# Auto kick HLTV

### Description:
Auto kick HLTV - is [AMX Mod X](https://github.com/alliedmodders/amxmodx) plugin, which automatically removes the HLTV server after a specified period of time.

### Requirements:
* AMX Mod X 1.8.1 or above

### Settings:
```
const KICK_DELAY = 20; // auto kick delay in minutes (default: 20)

// #define HLTV_CLIENTS_ALLOWED // uncomment this line if HLTV clients allowed on server
// #define USE_LOGGING // uncomment this line if you want use logging

#if defined HLTV_CLIENTS_ALLOWED
new const HLTV_IP[] = "127.0.0.1:27020"; // HLTV server IP (change it; default: "127.0.0.1:27020")
#endif
```
