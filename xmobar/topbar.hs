Config { 

   -- appearance
   --  font =         "xft:DejaVuSansMono Nerd Font:size=9:style:book:antialias=true"
     --font =         "xft:FuraCode Nerd Font:size=10:style:Regular:antialias=true"
     --font =         "xft:ShureTechMono Nerd Font:size=11:style:Regular:antialias=true"
     --font =         "xft:BitstreamVeraSansMono Nerd Font:size=10:style:Roman:antialias=true"
     font =         "xft:Mononoki Nerd Font:size=10:style:Regular:antialias=true"
   , bgColor =      "#ffffff"
   , fgColor =      "#191919"
   , position =     Top
   , border =       BottomB
   , borderColor =  "#be5046"
   , borderWidth = 0
   , alpha = 0

   -- layout
   , sepChar =  "%"   -- delineator between plugin names and straight text
   , alignSep = "}{"  -- separator between left-right alignment
   , template = "%StdinReader% }{Terminal Witchcraft  >><fc=#fb4934>%locks%</fc> %battery%  %bright%  %default:Master%  %date% "

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
        Run StdinReader
	-- network activity monitor (dynamic interface resolution)

        -- battery monitor
        , Run Battery        [ "--template" , "<acstatus>"
                             , "--Low"      , "10"        -- units: %
                             , "--High"     , "80"        -- units: %
                             , "--low"      , "#fb4934"
                             , "--normal"   , "#fe8019"
                             , "--high"     , "#be5046"

                             , "--" -- battery specific options
                                       -- discharging status
                                       , "-o"	, "<left>%"
                                       -- AC "on" status
                                       , "-O"	, "<fc=#b8bb26><left></fc>"
                                       -- charged status
                                       , "-i"	, "<fc=#fb4934></fc>"
                             ] 50

        -- time and date indicator 
	, Run Volume "default" "Master"
	            [ "-t",	"<status><volume>"
		    , "--"
		    , "-O",	" "
		    , "-o", 	" "
		    , "-C",	"#191919"
		    , "-c",	"#fb4934"
	            ] 10
        --   (%F = y-m-d date, %a = day of week, %T = h:m:s time)
        , Run Date           "<fc=#191919> %b %d,%A  %H:%M</fc>" "date" 10

        -- keyboard layout indicator
	, Run Locks
	, Run Brightness	["--template", " <percent>", "--", "-D", "intel_backlight"] 50
        ],
   }
