import System.IO
import System.Exit

import XMonad
import XMonad.Config.Kde
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageHelpers(doFullFloat, isFullscreen)
import XMonad.Config.Desktop
import XMonad.Util.Run(spawnPipe)
import XMonad.Actions.SpawnOn
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Actions.CycleWS
import XMonad.Hooks.FadeInactive
import XMonad.Hooks.UrgencyHook
import qualified Codec.Binary.UTF8.String as UTF8

import XMonad.Layout.Tabbed
import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders
import XMonad.Layout.LayoutHints
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
import Control.Monad (liftM2)
import qualified DBus as D
import qualified DBus.Client as D

setFullscreenSupported :: X ()
setFullscreenSupported = withDisplay $ \dpy -> do
    r <- asks theRoot
    a <- getAtom "_NET_SUPPORTED"
    c <- getAtom "ATOM"
    supp <- mapM getAtom ["_NET_WM_STATE_HIDDEN"
                         ,"_NET_WM_STATE_FULLSCREEN" -- XXX Copy-pasted to add this line
                         ,"_NET_NUMBER_OF_DESKTOPS"
                         ,"_NET_CLIENT_LIST"
                         ,"_NET_CLIENT_LIST_STACKING"
                         ,"_NET_CURRENT_DESKTOP"
                         ,"_NET_DESKTOP_NAMES"
                         ,"_NET_ACTIVE_WINDOW"
                         ,"_NET_WM_DESKTOP"
                         ,"_NET_WM_STRUT"
                         ]
    io $ changeProperty32 dpy r a c propModeReplace (fmap fromIntegral supp)

myLogHook :: D.Client -> PP
myLogHook dbus = def
    { ppOutput = dbusOutput dbus
    , ppCurrent = wrap ("%{u" ++ xmobarCurrentWorkspaceColor ++ "} ") " %{-u}"
    , ppVisible = wrap ("%{B" ++ xmobarCurrentWorkspaceColor ++ "} ") " %{B-}"
    -- , ppLayout = wrap ("%{B" ++ xmobarCurrentWorkspaceColor ++ "} ") " %{B-}"
    , ppUrgent = wrap ("%{F" ++ "#fe8019" ++ "} ") " %{F-}"
    , ppHidden = wrap " " " "
    , ppLayout = wrap ("%{u" ++ xmobarCurrentWorkspaceColor ++ "} ") " %{-u}"
    , ppWsSep = ""
    , ppSep = " "
    , ppOrder = \(ws:a:t:_) -> [ws,a,t]
    , ppTitle = shorten 40
    }

myLogHook2 :: X ()
myLogHook2 = fadeInactiveLogHook fadeAmount
    where fadeAmount = 0.8
-- Emit a DBus signal on log updates
dbusOutput :: D.Client -> String -> IO ()
dbusOutput dbus str = do
    let signal = (D.signal objectPath interfaceName memberName) {
            D.signalBody = [D.toVariant $ UTF8.decodeString str]
        }
    D.emit dbus signal
  where
    objectPath = D.objectPath_ "/org/xmonad/Log"
    interfaceName = D.interfaceName_ "org.xmonad.Log"
    memberName = D.memberName_ "Update"

myStartupHook = do
    setFullscreenSupported
    spawn ".config/polybar/launch.sh"
    spawnOn "4" "konsole -e neomutt"
    spawn myBrowser


 
myModMask = mod4Mask
myFocusFollowsMouse = False
myBrowser = "firefox"
myTopBar = "xmobar ~/.config/xmobar/topbar.hs"
myBottomBar = "xmobar ~/.config/xmobar/bottombar.hs"
myBorderWidth = 0
myTerminal = "konsole"
myScreensaver = "i3lock-fancy"
myWorkspaces = map show [1..9]
mySelectScreenshot = "scrot"
myScreenshot = "scrot"
myLauncher = "rofi -show drun"
myBaseConfig = desktopConfig
--myBaseConfig = defaultConfig

-- colors
myNormalBorderColor  = "#000000"
myFocusedBorderColor = "#fffff0"
xmobarTitleColor = "#ECEFF4"
-- Color of current workspace in xmobar.
xmobarCurrentWorkspaceColor = "#5DBCD2"


-- window manipulations
myManageHook = composeAll
    [ className =? "Chromium"       --> doShift "2"
    , className =? "Firefox"  --> viewShift "2"
    , className =? "qutebrowser"  --> viewShift "2"
    , className =? "Mailspring"  --> viewShift "4"
    , resource  =? "desktop_window" --> doIgnore
    , className =? "Galculator"     --> doFloat
    , className =? "NeovimGtk"     --> viewShift "4"
    , className =? "Steam"          --> doFloat
    , className =? "Gimp"           --> doFloat
    , className =? "tdrop"           --> doFloat
    , resource  =? "gpicview"       --> doFloat
    , className =? "MPlayer"        --> doFloat
    , className =? "mpv"        --> viewShift "3"
    , className =? "zathura"        --> viewShift "9"
    , className =? "Zathura"        --> viewShift "9"
    , className =? "stalonetray"    --> doIgnore
    , isFullscreen --> doFullFloat]
    where viewShift = doF . liftM2 (.) W.greedyView W.shift

-- layout config
--myLayout = avoidStruts (
--    ThreeColMid 1 (3/100) (1/2) |||
--    Tall 1 (3/100) (1/2) |||
--    Mirror (Tall 1 (3/100) (1/2)) |||
--    Full |||
--    spiral (6/7)) |||
--    noBorders (fullscreenFull Full)


tabConfig = defaultTheme {
    activeBorderColor = "#7C7C7C",
    activeTextColor = "#5DBCD2",
    activeColor = "#000000",
    inactiveBorderColor = "#7C7C7C",
    inactiveTextColor = "#EEEEEE",
    inactiveColor = "#000000",
	decoHeight = 48,
	fontName = "xft:Iosevka:size=22"
}

myLayout = layoutHints (avoidStrutsOn [U] (
    Tall 1 (3/100) (1/2) |||
	-- simpleTabBar (simpleTabbed) |||
    tabbed shrinkText tabConfig |||
    Mirror (Tall 1 (3/100) (1/2)) |||
    spiral (6/7)  |||
    Grid(16/10) ||| 
    ThreeColMid 1 (3/100) (1/2) ) ) |||
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

  , ((modMask, xK_r),
     spawn "konsole -e ranger")

  , ((modMask, xK_b),
     spawn myBrowser)
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
  , ((modMask, xK_q),
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
  ,((modMask, xK_f),
     sendMessage ToggleStruts)
  -- TODO: update this binding with avoidStruts, ((modMask, xK_b),

  , ((modMask, xK_s),
     sendMessage $ ToggleStrut D)
  -- Quit xmonad.
  , ((modMask .|. shiftMask, xK_c),
     io (exitWith ExitSuccess))

  -- Restart xmonad.
  , ((modMask .|. shiftMask, xK_q),
     restart "xmonad" True)
  ]
  ++

  -- mod-[1..9], Switch to workspace N
  -- mod-shift-[1..9], Move client to workspace N
  [((m .|. modMask, k), windows $ f i)
      | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
      , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
  -- ++

  -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
  -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
  -- [((m .|. modMask, key), screenWorkspace sc >>= flip whenJust (windows . f))
  --     | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
  --     , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]


main :: IO ()
main = do

    dbus <- D.connectSession
    -- Request access to the DBus name
    D.requestName dbus (D.busName_ "org.xmonad.Log")
        [D.nameAllowReplacement, D.nameReplaceExisting, D.nameDoNotQueue]


    xmonad . ewmh $
            myBaseConfig
                { logHook = myLogHook2 <+> dynamicLogWithPP (myLogHook dbus)
, startupHook = myStartupHook
, terminal = myTerminal
, layoutHook = smartBorders $ myLayout ||| layoutHook myBaseConfig
, manageHook = manageSpawn <+> myManageHook <+> manageHook myBaseConfig
, modMask = myModMask
, borderWidth = myBorderWidth
, handleEventHook    = handleEventHook myBaseConfig <+> fullscreenEventHook
, focusFollowsMouse = myFocusFollowsMouse
, workspaces = myWorkspaces
, keys = myKeys
, normalBorderColor = myNormalBorderColor
, focusedBorderColor = myFocusedBorderColor
}
  -- xmproc <- spawnPipe (myTopBar)
  -- spawn myBottomBar
  --xmonad . ewmh . withUrgencyHook NoUrgencyHook $ myBaseConfig
  --  { terminal    = myTerminal
  --  , startupHook = startupHook def <+> setFullscreenSupported
  --  --, startupHook = spawn "~/.config/xmonad/autorun.sh"
  --  --, layoutHook  = avoidStruts $ smartBorders $ layoutHook myBaseConfig
  --  , layoutHook  = smartBorders $ myLayout ||| layoutHook myBaseConfig
  --  --, manageHook  = manageDocks <+> myManageHook <+> manageHook myBaseConfig
  --  , manageHook  = myManageHook <+> manageHook myBaseConfig
  --  , modMask     = myModMask
  --  , borderWidth = myBorderWidth
  --  , focusFollowsMouse  = myFocusFollowsMouse
  --  , workspaces  = myWorkspaces
  --  , keys 	  = myKeys
  --  --, handleEventHook    = ewmhDesktopsEventHook <+> fullscreenEventHook
  --  --, handleEventHook    = handleEventHook myBaseConfig <+> docksEventHook
  --  , handleEventHook    = handleEventHook myBaseConfig <+> fullscreenEventHook
  --  --, handleEventHook = docksEventHook <+> fullscreenEventHook
  --  -- , logHook = dynamicLogWithPP $ xmobarPP {
  --  --   	    ppOutput = hPutStrLn xmproc . pad
  --  --   	  , ppTitle = xmobarColor xmobarTitleColor "" . shorten 50
		  ---- , ppHidden = xmobarColor "#E5E9F0" ""
  --  --   	  , ppCurrent = xmobarColor xmobarCurrentWorkspaceColor ""
  --  --   	  , ppVisible = xmobarColor xmobarCurrentWorkspaceColor ""
  --  --   	  -- , ppHiddenNoWindows = xmobarColor "#E5E9F0" ""
  --  --       , ppUrgent = xmobarColor "#fe8019" ""
		  ---- , ppLayout = xmobarColor xmobarCurrentWorkspaceColor ""
  --  --       , ppOrder = \(ws:a:t:_) -> [ws,a,t]
  --  --   	  , ppSep = " "
  --  --   	  , ppWsSep = " "
	---- }
  --  , logHook = dynamicLogWithPP (myLogHook dbus)
  --  , normalBorderColor = myNormalBorderColor
  --  , focusedBorderColor = myFocusedBorderColor
  --  }
