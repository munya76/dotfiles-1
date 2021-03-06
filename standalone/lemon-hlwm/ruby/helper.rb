

# ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----
# helpers

# script arguments
def get_monitor(arguments)
  # ternary operator
  arguments.length > 0 ? arguments[0].to_i : 0
end

# ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----
# geometry calculation

def get_geometry(monitor)
  raw = IO.popen('herbstclient monitor_rect '+ monitor.to_s).read()

  if raw.to_s.empty?
    print('Invalid monitor ' + monitor.to_s)
    exit(1)
  end
    
  raw.split(' ')
end

def get_top_panel_geometry(height, geometry)
  # geometry has the format X Y W H
  return geometry[0].to_i, geometry[1].to_i, 
         geometry[2].to_i, height
end

def get_bottom_panel_geometry(height, geometry)
  # geometry has the format X Y W H
  return geometry[0].to_i + 0, (geometry[3].to_i - height), 
         geometry[2].to_i - 0, height
end

# ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----
# lemon Parameters

def get_params_top(monitor, panel_height)
  # calculate geometry
  geometry = get_geometry(monitor)
  xpos, ypos, width, height = get_top_panel_geometry(
    panel_height, geometry)

  # geometry: -g widthxheight+x+y
  geom_res = "#{width}x#{height}+#{xpos}+#{ypos}"

  # color, with transparency    
  bgcolor = "'#aa000000'"
  fgcolor = "'#ffffff'"

  # XFT: require lemonbar_xft_git 
  font_takaop  = "takaopgothic-9"
  font_symbol  = "PowerlineSymbols-11"
  font_awesome = "FontAwesome-9"

  parameters = " -g #{geom_res} -u 2" \
               " -B #{bgcolor} -F #{fgcolor}" \
               " -f #{font_takaop} -f #{font_awesome} -f #{font_symbol}"
end

def get_params_bottom(monitor, panel_height)
  # calculate geometry
  geometry = get_geometry(monitor)
  xpos, ypos, width, height = get_bottom_panel_geometry(
    panel_height, geometry)

  # geometry: -g widthxheight+x+y
  geom_res = "#{width}x#{height}+#{xpos}+#{ypos}"

  # color, with transparency    
  bgcolor = "'#aa000000'"
  fgcolor = "'#ffffff'"

  # XFT: require lemonbar_xft_git 
  font_mono    = "monospace-9"
  font_symbol  = "PowerlineSymbols-11"
  font_awesome = "FontAwesome-9"

  parameters = " -g #{geom_res} -u 2" \
               " -B #{bgcolor} -F #{fgcolor}" \
               " -f #{font_mono} -f #{font_awesome} -f #{font_symbol}"
end

def get_lemon_parameters(monitor, panel_height)
  get_params_top(monitor, panel_height)
end
