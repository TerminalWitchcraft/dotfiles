import System.IO
import System.Exit
import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Layout.Tabbed
import XMonad.Layout.Spacing
import XMonad.Layout.Fullscreen hiding (fullscreenEventHook)
import XMonad.Layout.NoBorders
import XMonad.Layout.Spiral
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.SetWMName
import XMonad.Actions.CycleWS
import XMonad.Util.Scratchpad
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import Graphics.X11.ExtraTypes.XF86
import qualified XMonad.StackSet as W
import qualified Data.Map as M

myTerminal = "urxvt"
myScreensaver = "i3lock-fancy"
myXmobarrc = "~/.xmobarrc"
myWorkspaces = ["1:term","2:web","3:play","4:vm","5:media"] ++ map show [6..9]
mySelectScreenshot = "scrot"
myScreenshot = "scrot"
myLauncher = "rofi -show run"

myManageHook = composeAll
    [ className =? "Chromium"       --> doShift "2:web"
    , className =? "Firefox"  --> doShift "2:web"
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

myNormalBorderColor  = "#000000"
myFocusedBorderColor = "#ffb6b0"
xmobarTitleColor = "#FFB6B0"

-- Color of current workspace in xmobar.
xmobarCurrentWorkspaceColor = "#CEFFAC"

-- Width of the window border in pixels.
myBorderWidth = 1
myModMask = mod4Mask
--myLayout = avoidStruts (
--    ThreeColMid 1 (3/100) (1/2) |||
--    Tall 1 (3/100) (1/2) |||
--    Mirror (Tall 1 (3/100) (1/2)) |||
--    tabbed shrinkText tabConfig |||
--    Full |||
--    spiral (6/7)) |||
--    noBorders (fullscreenFull Full)
--myLayout = tiled ||| Mirror tiled ||| Full
--  where
--    tiled = smartSpacing 5 $ Tall nmaster delta ratio
--    nmaster = 1
--    ratio = 1/2
--    delta = 3/100

manageScratchPad :: ManageHook
manageScratchPad = scratchpadManageHook (W.RationalRect l t w h)

  where

    h = 0.3     -- terminal height, 10%
    w = 1       -- terminal width, 100%
    --t = 1 - h   -- distance from top edge, 90%
    --l = 1 - w   -- distance from left edge, 0%
    t = 0   -- distance from top edge, 90%
    l = 0   -- distance from left edge, 0%


myLayout = avoidStruts (
    smartSpacingWithEdge 3 ( Tall 1 (3/100) (1/2) )|||
    smartSpacingWithEdge 3 ( Mirror (Tall 1 (3/100) (1/2))) |||
    --tabbed shrinkText tabConfig |||
    simpleTabbedAlways) |||
    noBorders (fullscreenFull Full)
    

tabConfig = defaultTheme {
    activeBorderColor = "#7C7C7C",
    activeTextColor = "#CEFFAC",
    activeColor = "#000000",
    inactiveBorderColor = "#7C7C7C",
    inactiveTextColor = "#EEEEEE",
    inactiveColor = "#000000"
}


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

  , ((controlMask, xK_space),
     spawn myLauncher)
  , ((modMask, xK_d),
     scratchpadSpawnActionTerminal "urxvt")
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
  , ((0, xF86XK_KbdBrightnessUp),
     spawn "light -A 5")

  -- Increase volume.
  , ((0, xF86XK_KbdBrightnessDown),
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

  -- Audio previous.
  , ((0, 0x1008FF16),
     spawn "")

  -- Play/pause.
  , ((0, 0x1008FF14),
     spawn "")

  -- Audio next.
  , ((0, 0x1008FF17),
     spawn "")

  -- Eject CD tray.
  , ((0, 0x1008FF2C),
     spawn "eject -T")

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
  -- TODO: update this binding with avoidStruts, ((modMask, xK_b),

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



main = do
  xmproc <- spawnPipe ("xmobar " ++ myXmobarrc)
  xmonad $ defaultConfig {
	logHook = dynamicLogWithPP $ xmobarPP {
		    ppOutput = hPutStrLn xmproc
		  , ppTitle = xmobarColor xmobarTitleColor "" . shorten 50
		  , ppCurrent = xmobarColor xmobarCurrentWorkspaceColor ""
                  , ppUrgent = xmobarColor "#fe8019" ""
                  , ppOrder = \(ws:_:t:_) -> [ws,t]
		  , ppSep = "  "
	}
	, manageHook = manageDocks <+> myManageHook <+> manageHook defaultConfig <+> manageScratchPad
	--      , startupHook = docksStartupHook <+> setWMName "LG3D"
	, startupHook = setWMName "VXMonad"
	, handleEventHook = docksEventHook <+> fullscreenEventHook
    -- simple stuff
    , terminal           = myTerminal
    --focusFollowsMouse  = myFocusFollowsMouse,
    , borderWidth        = myBorderWidth
    --, layoutHook = avoidStruts  $  layoutHook defaultConfig
    , modMask            = myModMask
    , workspaces         = myWorkspaces
    , normalBorderColor  = myNormalBorderColor
    , focusedBorderColor = myFocusedBorderColor
    -- key bindings
    , keys               = myKeys
    --mouseBindings      = myMouseBindings,

    -- hooks, layouts
    , layoutHook         = smartBorders $ myLayout
  }

--defaults = defaultConfig {
--    -- simple stuff
--    terminal           = myTerminal,
--    --focusFollowsMouse  = myFocusFollowsMouse,
--    borderWidth        = myBorderWidth,
--    modMask            = myModMask,
--    workspaces         = myWorkspaces,
--    normalBorderColor  = myNormalBorderColor,
--    focusedBorderColor = myFocusedBorderColor,
--
--    -- key bindings
--    --keys               = myKeys,
--    --mouseBindings      = myMouseBindings,
--
--    -- hooks, layouts
--    --layoutHook         = smartBorders $ myLayout,
--    manageHook         = myManageHook,
--    startupHook        = myStartupHook
--}

