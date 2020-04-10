set_global_assignment -entity "PLL_50_TO_250M" -library "lib_PLL_50_TO_250M" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "PLL_50_TO_250M" -library "lib_PLL_50_TO_250M" -name IP_TOOL_VERSION "17.1"
set_global_assignment -entity "PLL_50_TO_250M" -library "lib_PLL_50_TO_250M" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_PLL_50_TO_250M" -name SPD_FILE [file join $::quartus(sip_path) "PLL_50_TO_250M.spd"]

set_global_assignment -library "lib_PLL_50_TO_250M" -name MISC_FILE [file join $::quartus(sip_path) "PLL_50_TO_250M_sim/PLL_50_TO_250M.vo"]
