import System.IO
import System.Exit

import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageHelpers(doFullFloat, isFullscreen)
import XMonad.Config.Desktop
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Actions.CycleWS


import XMonad.Layout.Tabbed
import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders
import XMonad.Layout.Fullscreen (fullscreenFull)
import XMonad.Layout.Cross(simpleCross)
import XMonad.Layout.Cross(simpleCross)
import XMonad.Layout.Spiral(spiral)
import XMonad.Layout.GridVariants
import XMonad.Layout.ThreeColumns

import XMonad.Layout.CenteredMaster(centerMaster)

import Graphics.X11.ExtraTypes.XF86
import qualified XMonad.StackSet as W
import qualified Data.Map as M


main = do
  xmproc <- spawnPipe (myTopBar)
  spawn myBottomBar
  xmonad $ docks $ ewmh myBaseConfig
    { terminal    = myTerminal
    --, startupHook = spawn "~/.config/xmonad/autorun.sh"
    --, layoutHook  = avoidStruts $ smartBorders $ layoutHook myBaseConfig
    , layoutHook  = smartBorders $ myLayout 
    --, manageHook  = manageDocks <+> myManageHook <+> manageHook myBaseConfig
    , manageHook  = myManageHook
    , modMask     = myModMask
    , borderWidth = myBorderWidth
    , focusFollowsMouse  = myFocusFollowsMouse
    , workspaces  = myWorkspaces
    , keys 	  = myKeys
    --, handleEventHook    = ewmhDesktopsEventHook <+> fullscreenEventHook
    --, handleEventHook    = handleEventHook myBaseConfig <+> docksEventHook
    , handleEventHook    = handleEventHook myBaseConfig <+> fullscreenEventHook
    --, handleEventHook = docksEventHook <+> fullscreenEventHook
    , logHook = dynamicLogWithPP $ xmobarPP {
      	    ppOutput = hPutStrLn xmproc . pad
      	  , ppTitle = xmobarColor xmobarTitleColor "" . shorten 50
	  , ppHidden = xmobarColor "#5c6370" ""
      	  , ppCurrent = xmobarColor xmobarCurrentWorkspaceColor ""
          , ppUrgent = xmobarColor "#fe8019" ""
	  , ppLayout = xmobarColor xmobarCurrentWorkspaceColor ""
          , ppOrder = \(ws:a:t:_) -> [ws,a,t]
      	  , ppSep = " "
      	  , ppWsSep = " "
	}
    , normalBorderColor = myNormalBorderColor
    , focusedBorderColor = myFocusedBorderColor
    }

 
myModMask = mod4Mask
myFocusFollowsMouse = False
myTopBar = "xmobar ~/.config/xmobar/topbar.hs"
myBottomBar = "xmobar ~/.config/xmobar/bottombar.hs"
myBorderWidth = 3
myTerminal = "alacritty"
myScreensaver = "i3lock-fancy"
myWorkspaces = ["\xf120", "\xf269"] ++ map show [3..9]
mySelectScreenshot = "scrot"
myScreenshot = "scrot"
myLauncher = "rofi -show run"
myBaseConfig = desktopConfig
--myBaseConfig = defaultConfig

-- colors
myNormalBorderColor  = "#ffffff"
myFocusedBorderColor = "#be5046"
xmobarTitleColor = "#323232"
-- Color of current workspace in xmobar.
xmobarCurrentWorkspaceColor = "#be5046"


-- window manipulations
myManageHook = composeAll
    [ className =? "Chromium"       --> doShift "\xf269"
    , className =? "Firefox"  --> doShift "\xf269"
    , resource  =? "desktop_window" --> doIgnore
    , className =? "Galculator"     --> doFloat
    , className =? "Steam"          --> doFloat
    , className =? "Gimp"           --> doFloat
    , className =? "tdrop"           --> doFloat
    , resource  =? "gpicview"       --> doFloat
    , className =? "MPlayer"        --> doFloat , className =? "VirtualBox"     --> doShift "4:vm"
    , className =? "Xchat"          --> doShift "5:media"
    , className =? "stalonetray"    --> doIgnore
    , isFullscreen --> doFullFloat]

-- layout config
--myLayout = avoidStruts (
--    ThreeColMid 1 (3/100) (1/2) |||
--    Tall 1 (3/100) (1/2) |||
--    Mirror (Tall 1 (3/100) (1/2)) |||
--    Full |||
--    spiral (6/7)) |||
--    noBorders (fullscreenFull Full)
myLayout = avoidStrutsOn [U] (
    Tall 1 (3/100) (1/2) |||
    Mirror (Tall 1 (3/100) (1/2)) |||
    spiral (16/9)  |||
    Grid(16/10) ||| 
    ThreeColMid 1 (3/100) (1/2) ) |||
    noBorders (fullscreenFull Full)

-- keys config

myKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $
  ----------------------------------------------------------------------
  -- Custom key bindings
  --

  -- Start a terminal.  Terminal to start is specified by myTerminal variable.
  [ ((modMask .|. shiftMask, xK_Return),
     windows W.swapMaster)

  -- Lock the screen using command specified by myScreensaver.
  , ((modMask .|. shiftMask, xK_l),
     spawn myScreensaver)

  , ((modMask, xK_semicolon),
     spawn myLauncher)
  -- Spawn the launcher using command specified by myLauncher.
  -- Use this to launch programs without a key binding.
  , ((modMask, xK_n),
     nextWS)

  -- Take a selective screenshot using the command specified by mySelectScreenshot.
  , ((modMask .|. shiftMask, xK_p),
     spawn mySelectScreenshot)

  -- Take a full screenshot using the command specified by myScreenshot.
  , ((modMask .|. controlMask .|. shiftMask, xK_p),
     spawn myScreenshot)

  -- Mute volume.
  , ((0, xF86XK_AudioMute),
     spawn "amixer -q set Master toggle")

  -- Decrease volume.
  , ((0, xF86XK_AudioLowerVolume),
     spawn "amixer -q set Master 5%-")

  -- Increase volume.
  , ((0, xF86XK_AudioRaiseVolume),
     spawn "amixer -q set Master 5%+")

  -- Decrease volume.
  , ((0, xF86XK_MonBrightnessUp),
     spawn "light -A 5")

  -- Increase volume.
  , ((0, xF86XK_MonBrightnessDown),
     spawn "light -U 5")
  -- Mute volume.
  , ((modMask .|. controlMask, xK_m),
     spawn "amixer -q set Master toggle")

  -- Decrease volume.
  , ((modMask .|. controlMask, xK_j),
     spawn "amixer -q set Master 5%-")

  -- Increase volume.
  , ((modMask .|. controlMask, xK_k),
     spawn "amixer -q set Master 5%+")

  -- -- Audio previous.
  -- , ((0, 0x1008FF16),
  --    spawn "")

  -- -- Play/pause.
  -- , ((0, 0x1008FF14),
  --    spawn "")

  -- -- Audio next.
  -- , ((0, 0x1008FF17),
  --    spawn "")

  -- -- Eject CD tray.
  -- , ((0, 0x1008FF2C),
  --    spawn "eject -T")

  --------------------------------------------------------------------
  -- "Standard" xmonad key bindings
  --

  -- Close focused window.
  , ((modMask .|. shiftMask, xK_q),
     kill)

  -- Cycle through the available layout algorithms.
  , ((modMask, xK_space),
     sendMessage NextLayout)

  --  Reset the layouts on the current workspace to default.
  , ((modMask .|. shiftMask, xK_space),
     setLayout $ XMonad.layoutHook conf)

  -- Resize viewed windows to the correct size.
  , ((modMask, xK_p),
     toggleWS)

  -- Move focus to the next window.
  , ((modMask, xK_Tab),
     windows W.focusDown)

  -- Move focus to the next window.
  , ((modMask, xK_j),
     windows W.focusDown)

  -- Move focus to the previous window.
  , ((modMask, xK_k),
     windows W.focusUp  )

  -- Move focus to the master window.
  , ((modMask, xK_m),
     windows W.focusMaster  )

  -- Swap the focused window and the master window.
  , ((modMask, xK_Return),
     spawn $ XMonad.terminal conf)

  -- Swap the focused window with the next window.
  , ((modMask .|. shiftMask, xK_j),
     windows W.swapDown  )

  -- Swap the focused window with the previous window.
  , ((modMask .|. shiftMask, xK_k),
     windows W.swapUp    )

  -- Shrink the master area.
  , ((modMask, xK_h),
     sendMessage Shrink)

  -- Expand the master area.
  , ((modMask, xK_l),
     sendMessage Expand)

  -- Push window back into tiling.
  , ((modMask, xK_t),
     withFocused $ windows . W.sink)

  -- Increment the number of windows in the master area.
  , ((modMask, xK_comma),
     sendMessage (IncMasterN 1))

  -- Decrement the number of windows in the master area.
  , ((modMask, xK_period),
     sendMessage (IncMasterN (-1)))

  -- Toggle the status bar gap.
  ,((modMask, xK_b),
     sendMessage ToggleStruts)
  -- TODO: update this binding with avoidStruts, ((modMask, xK_b),

  , ((modMask, xK_s),
     sendMessage $ ToggleStrut D)
  -- Quit xmonad.
  , ((modMask .|. shiftMask, xK_c),
     io (exitWith ExitSuccess))

  -- Restart xmonad.
  , ((modMask, xK_q),
     restart "xmonad" True)
  ]
  ++

  -- mod-[1..9], Switch to workspace N
  -- mod-shift-[1..9], Move client to workspace N
  [((m .|. modMask, k), windows $ f i)
      | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
      , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
  ++

  -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
  -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
  [((m .|. modMask, key), screenWorkspace sc >>= flip whenJust (windows . f))
      | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
      , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]
