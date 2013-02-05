-- bottom area
Config {
font = "xft:Bitstream Vera Sans mono:size=8,xft:Daramgee:fixelsize=9,xft:kochi-mincho-subst:antialias=false",
bgColor = "#000000",
fgColor = "#ffffff",
position = Static { xpos = 0, ypos = 752, width = 1246, height = 16 },
lowerOnStart = True,
commands = [
 Run Weather "RKSL" ["-t","<tempC>C <skyCondition>","-L","0","-H","25","-n","#CEFFAC","-h","#FFB6B0","-l","#96CBFE"] 36000 
, Run Date "%a %b %_d %l:%M" "date" 10
, Run Network "eth0" ["-t","Net: <rx>, <tx>","-H","200","-L","10","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10            
, Run Network "eth1" ["-t","Net: <rx>, <tx>","-H","200","-L","10","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10            
, Run Network "usb0" ["-t","Net: <rx>, <tx>","-H","200","-L","10","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10            
, Run Com "uname" ["-s","-r", "-n"] "" 36000
, Run MPD ["-t","<state> <artist> - <title> (<album>)"] 10                                
		],
sepChar = "%",
alignSep = "}{"
             , template = "<fc=#FFFFCC>%date%</fc> |  %mpd%   }{  %eth0% %eth1% %usb0% | %RKSL% | %uname%  "
}
