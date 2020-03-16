set_global_assignment -entity "cordic_atan2_v2" -library "lib_cordic_atan2_v2" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "cordic_atan2_v2" -library "lib_cordic_atan2_v2" -name IP_TOOL_VERSION "17.1"
set_global_assignment -entity "cordic_atan2_v2" -library "lib_cordic_atan2_v2" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_cordic_atan2_v2" -name SPD_FILE [file join $::quartus(sip_path) "../cordic_atan2_v2.spd"]
set_global_assignment -library "lib_cordic_atan2_v2" -name MISC_FILE [file join $::quartus(sip_path) "../../cordic_atan2_v2.qsys"]

set_global_assignment -library "lib_cordic_atan2_v2" -name MISC_FILE [file join $::quartus(sip_path) "cordic_atan2_v2.vhd"]
set_global_assignment -library "lib_cordic_atan2_v2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/dspba_library_package.vhd"]
set_global_assignment -library "lib_cordic_atan2_v2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/dspba_library.vhd"]
set_global_assignment -library "lib_cordic_atan2_v2" -name MISC_FILE [file join $::quartus(sip_path) "submodules/cordic_atan2_v2_CORDIC_0.vhd"]
