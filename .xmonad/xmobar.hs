-- xmobar config used by Vic Fryzel
-- Author: Vic Fryzel
-- http://github.com/vicfryzel/xmonad-config

-- This is setup for dual 1920x1080 monitors, with the right monitor as primary
Config {
        font = "xft:Bitstream Vera Sans mono:size=8,xft:Daramgee:fixelsize=9,xft:kochi-mincho-subst:antialias=false"
       ,bgColor = "#000000"
       ,fgColor = "#ffffff"
       ,position = Static { xpos = 0, ypos = 0, width = 1366, height = 16 }
       ,lowerOnStart = True
       ,commands = [
          Run MultiCpu ["-t","Cpu: <total0> <total1>","-L","30","-H","60","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC","-w","3"] 10
         ,Run Memory ["-t","Mem: <usedratio>%","-H","2048","-L","1024","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10
         ,Run Swap ["-t","Swap: <usedratio>%","-H","1024","-L","512","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 60
         ,Run StdinReader
         ,Run TopMem [] 60
         ,Run TopProc [] 30                                
         ,Run CpuFreq ["-t","Freq: <cpu0> / <cpu1>","-L","0","-H","2","-l","green","-n","green","-h","red"] 60
         ,Run CoreTemp ["-t","Temp:<core0> / <core1>C","-L","40","-H","60","-l","green","-n","gray90","-h","red"] 60
         ]
       ,sepChar = "%"
       ,alignSep = "}{"
       ,template = "%StdinReader% }{  %multicpu% (%top%) | %cpufreq%  | %coretemp% | %memory% (%topmem%) | %swap%"
       }
 
