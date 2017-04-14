-- vim: ts=4 sw=4 noet ai cindent syntax=lua

--[[
Conky, a system monitor, based on torsmo
]]

conky.config = {
    out_to_x = false,
    out_to_console = true,
    short_units = true,
    update_interval = 1
}

colGrey900  = '\\#212121'
colGrey200  = '\\#eeeeee'

colAlphaBlue500  = '\\#aa2196f3'
colGreen500 = '\\#4caf50'
colRed500   = '\\#f44336'

conky.text = [[\
%{r} \
%{B-}%{F-}%{-u}\
%{F]] .. colRed500 ..[[}\
  \
%{l} \
%{B-}%{F-}%{-u}\
  \
%{F]] .. colRed500 ..[[}\
%{c}\
%{B-}%{F-}%{-u}\
%{F]] .. colGreen500 ..[[}\
%{B]] .. colGreen500 ..[[}%{U]] .. colGrey200 ..[[}%{+u}\
%{F]] .. colGrey200 ..[[}  \
%{B]] .. colAlphaBlue500 .. [[}%{U]] .. colGrey900 ..[[}%{+u}\
%{F]] .. colGreen500 .. [[}\
%{F]] .. colGrey900 ..[[} \
%{F]] .. colGrey200 ..[[} ${time %a %b %d}  \
%{F]] .. colGreen500 ..[[}\
\
%{B-}%{F-}%{-u}\
%{B]] .. colGreen500 ..[[}%{U]] .. colGrey200 ..[[}%{+u}\
%{F]] .. colGrey200 ..[[} \
%{F]] .. colGrey900 ..[[} ${time %H:%M:%S}  \
%{B-}%{F-}%{-u}\
%{F]] .. colGreen500 ..[[}\
\
]]
