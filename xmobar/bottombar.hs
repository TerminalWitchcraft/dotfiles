Config { 

   -- appearance
   --  font =         "xft:DejaVuSansMono Nerd Font:size=9:style:book:antialias=true"
     --font =         "xft:FuraCode Nerd Font:size=10:style:Regular:antialias=true"
     --font =         "xft:ShureTechMono Nerd Font:size=11:style:Regular:antialias=true"
     --font =         "xft:BitstreamVeraSansMono Nerd Font:size=10:style:Roman:antialias=true"
     font =         "xft:Mononoki Nerd Font:size=10:style:Regular:antialias=true"
   , bgColor =      "#ffffff"
   , fgColor =      "#191919"
   , position =     Bottom
   , border =       NoBorder
   , borderColor =  "#191919"
   , borderWidth = 0
   --, alpha = 0

   -- layout
   , sepChar =  "%"   -- delineator between plugin names and straight text
   , alignSep = "}{"  -- separator between left-right alignment
   , template = "hotshot@void -> %uptime%  %coretemp%  %disku%  %multicpu%  %memory% }{%dynnetwork%  %wlp59s0wi%"

   -- general behavior
   , lowerOnStart =     True    -- send to bottom of window stack on start
   , hideOnStart =      False   -- start with window unmapped (hidden)
   , allDesktops =      True    -- show on all desktops
   , overrideRedirect = True    -- set the Override Redirect flag (Xlib)
   , pickBroadest =     False   -- choose widest display (multi-monitor)
   , persistent =       False    -- enable/disable hiding (True = disabled)

   -- plugins
   --   Numbers can be automatically colored according to their value. xmobar
   --   decides color based on a three-tier/two-cutoff system, controlled by
   --   command options:
   --     --Low sets the low cutoff
   --     --High sets the high cutoff
   --
   --     --low sets the color below --Low cutoff
   --     --normal sets the color between --Low and --High cutoffs
   --     --High sets the color above --High cutoff
   --
   --   The --template option controls how the plugin is displayed. Text
   --   color can be set by enclosing in <fc></fc> tags. For more details
   --   see http://projects.haskell.org/xmobar/#system-monitor-plugins.
   , commands = 

        -- weather monitor
        [
	-- network activity monitor (dynamic interface resolution)
        Run DynNetwork     [ "--template" , " <tx>kB/s  <rx>kB/s"
                             , "--Low"      , "100000"       -- units: B/s
                             , "--High"     , "50000000"       -- units: B/s
                             , "--low"      , "#191919"
                             , "--normal"   , "#191919"
                             , "--high"     , "#be5046"
                             ] 10
        , Run Wireless  "wlp59s0"   [ "--template" , "<qualitybar> [<essid>]"
                             ] 50
	, Run Uptime 	[ "--template", "UPTIME: <days>d <hours>h <minutes>m" ] 3600

        -- cpu activity monitor
        , Run MultiCpu       [  "--template" , "CPU: <total>% <bar>"
			     , "--Low"      , "50"         -- units: %
                             , "--High"     , "85"         -- units: %
                             , "--low"      , "#191919"
                             , "--normal"   , "#191919"
                             , "--high"     , "#e06c75"
                             --, "--bwidth"     , "5"
			     , "-b",         ":"
			     , "-f",		"#"
                             ] 10
        -- cpu core temperature monitor
        , Run CoreTemp       [ "--template" , "TEMP: <core0>|<core1>|<core2>|<core3>|<core4>|<core5>|<core6>°C"
                             , "--Low"      , "30"        -- units: °C
                             , "--High"     , "65"        -- units: °C
                             , "--low"      , "#191919"
                             , "--normal"   , "#191919"
                             , "--high"     , "#e06c75"
                             ] 30
                          
        -- memory usage monitor
        , Run Memory         [ "--template" ,"MEM: <usedratio>% <usedbar>(<cache>M)"
                             , "--Low"      , "20"        -- units: %
                             , "--High"     , "14000"        -- units: %
                             , "--low"      , "#191919"
                             , "--normal"   , "#191919"
                             , "--high"     , "#e06c75"
                             ] 20
	, Run DiskU [("/", "ROOT:<usedp>%")]
         	["-L", "20", "-H", "50", "-m", "1", "-p", "3"]
         9000

        ],
   }
