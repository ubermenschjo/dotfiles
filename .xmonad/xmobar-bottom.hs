-- bottom area
Config {
  font = "xft:Bitstream Vera Sans mono:size=8,xft:Daramgee:fixelsize=9,xft:kochi-mincho-subst:antialias=false"
  ,bgColor = "#000000"
  ,fgColor = "#ffffff"
  ,position = Static { xpos = 0, ypos = 752, width = 1246, height = 16 }
  ,lowerOnStart = True
  ,commands = [
    Run Weather "RKSL" ["-t","<tempC>C <skyCondition>","-L","0","-H","25","-n","#CEFFAC","-h","#FFB6B0","-l","#96CBFE"] 36000 
    , Run Date "%a %b %_d %l:%M" "date" 10
    , Run Wireless "wlan0" [] 10
    , Run DynNetwork [] 10
    , Run Volume "default" "Master" [] 10
    , Run Brightness ["-t", "Brightness : <percent>%","--", "-D", "/sys/class/backlight/intel_backlight"] 60
    , Run Com "uname" ["-s","-r", "-n"] "" 36000
    , Run MPD ["-t","<state> <artist> - <title> (<album>)"] 10
    , Run BatteryP ["BAT1"]["-t", "Bat: <acstatus><watts> (<left>%)","-L", "10", "-H", "80", "-p", "3","--", "-O", "<fc=green>On</fc> - ", "-o", "","-L", "-15", "-H", "-5","-l", "red", "-m", "blue", "-h", "green"] 600          
    ]
  ,sepChar = "%"
  ,alignSep = "}{"
--             , template = "<fc=#FFFFCC>%date%</fc> |  %mpd%   }{  %eth0% %wlan0% %usb0% | %RKSL% | %uname%  "
  , template = "<fc=#FFFFCC>%date%</fc> | %default:Master% | %mpd% }{ %dynnetwork% %wlan0wi% | %RKSL% | %bright% | %battery% | %uname%  "
  }
