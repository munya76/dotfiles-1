-- vim: ts=4 sw=4 noet ai cindent syntax=lua

--[[
Conky, a system monitor, based on torsmo
https://github.com/brndnmtthws/conky/wiki/Convert-to-new-1.10-syntax
]]

conky.config = {
    background = false,
    out_to_x = false,
    out_to_console = true,
    update_interval = 1,
    total_run_times = 0,
    use_spacer = "none"
}

conky.text = [[ 
${if_mpd_playing}♫  ${mpd_artist} -  ${mpd_title} | ${endif}\
${time %H:%M:%S}    
]]
