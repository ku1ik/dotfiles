import XMonad
import XMonad.Config.Gnome
import XMonad.Config.Desktop
import XMonad.Util.EZConfig
import XMonad.Layout.Reflect
import XMonad.Layout.NoBorders
import XMonad.Layout.PerWorkspace
import XMonad.Layout.IM
import XMonad.Layout.Grid
import XMonad.Layout.ToggleLayouts
import XMonad.Actions.WindowGo
import XMonad.Actions.CycleWS
import XMonad.Actions.PhysicalScreens
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.ManageHelpers
import System.Posix.Unistd
import Data.List
import Data.Ratio ((%))
import Control.Monad (liftM2)
import qualified XMonad.StackSet as W

-- for fullscreen
import Monad
import Data.Monoid (All (All))
import Data.Maybe
import XMonad.Util.XUtils (fi)
import XMonad.Util.WindowProperties (getProp32)

myWorkspaces = ["1", "2", "3", "4", "5", "6"]

myLayout = desktopLayoutModifiers
           $ smartBorders
           $ toggleLayouts Full
           $ onWorkspace "4" imLayout
           $ baseLayout
  where
    baseLayout = Tall 1 0.1 0.66 ||| reflectHoriz (Tall 1 0.1 0.66) ||| Mirror(Tall 1 0.1 0.66) ||| reflectVert (Mirror(Tall 1 0.1 0.66))
    jabberRoster = And (Role "contact_list") (ClassName "Empathy")
    skypeRoster = And (Role "MainWindow") (ClassName "Skype")
    imLayout = withIM (0.16) jabberRoster $ reflectHoriz $ withIM (0.2) skypeRoster Grid
    {- imLayout = withIM (1%6) roster Grid-}

myKeys =
    [ ("M-S-r", spawn "xmonad --recompile && xmonad --restart")
    , ("M-q", kill)
    , ("M-u", focusUrgent)
    , ("M-o", toggleWS)
    , ("M-S-l", spawn "gnome-screensaver-command -l")
    , ("M-[", moveTo Prev HiddenWS)
    , ("M-]", moveTo Next HiddenWS)
    , ("M-S-[", shiftTo Prev HiddenWS)
    , ("M-S-]", shiftTo Next HiddenWS)
    , ("M-f", sendMessage $ ToggleLayout)
    , ("M-d", spawn "notify-send \"$(date)\"")
    ]

myKeys2 = [((mod4Mask .|. mask, key), f sc)
     | (key, sc) <- zip [xK_w, xK_e] [0..]
     , (f, mask) <- [(viewScreen, 0), (sendToScreen, shiftMask)]]

myManageHook = composeAll . concat $
   [ [ isDialog --> doCenterFloat ]
   , [ isFullscreen --> doFullFloat ]
   -- , [ className =? "Gvim" --> viewShift "3" ]
   , [ className =? "Empathy" --> viewShift "4" ]
   , [ className =? "Skype" --> viewShift "4" ]
   , [ className =? "Screenkey" --> doF W.focusDown ] {- doIgnore also -}
   , [ appName =? "update-manager" --> doCenterFloat ]
   , [ title =? "Are you sure?" --> doCenterFloat ]
     -- using list comprehensions and partial matches
   , [ className =? c --> doFloat | c <- myFloatsC ]
   , [ className =? c --> doCenterFloat | c <- myCenteredFloatsC ]
   , [ title =? t --> doFloat | t <- myFloatsT ]
   , [ fmap ( c `isInfixOf`) className --> doFloat | c <- myMatchAnywhereFloatsC ]
   , [ fmap ( c `isInfixOf`) title     --> doFloat | c <- myMatchAnywhereFloatsT ]
   ]
   -- in a composeAll hook, you'd use: fmap ("VLC" `isInfixOf`) title --> doFloat
  where myFloatsC = ["MPlayer", "Gimp", "Screenkey"]
        myCenteredFloatsC = ["Gcalctool", "Xmessage"]
        myFloatsT = []
        myMatchAnywhereFloatsC = []
        myMatchAnywhereFloatsT = ["VLC"]
        viewShift = doF . liftM2 (.) W.greedyView W.shift


-- |
-- An event hook to handle applications that wish to fullscreen using the
-- _NET_WM_STATE protocol. This includes users of the gtk_window_fullscreen()
-- function, such as Totem, Evince and OpenOffice.org.
fullscreenEventHook :: Event -> X All
fullscreenEventHook (ClientMessageEvent _ _ _ dpy win typ (action:dats)) = do
  state <- getAtom "_NET_WM_STATE"
  fullsc <- getAtom "_NET_WM_STATE_FULLSCREEN"
  wstate <- fromMaybe [] `fmap` getProp32 state win

  let isFull = fromIntegral fullsc `elem` wstate

      -- Constants for the _NET_WM_STATE protocol:
      remove = 0
      add = 1
      toggle = 2
      ptype = 4 -- The atom property type for changeProperty
      chWstate f = io $ changeProperty32 dpy win state ptype propModeReplace (f wstate)

  when (typ == state && fi fullsc `elem` dats) $ do
    when (action == add || (action == toggle && not isFull)) $ do
      chWstate (fi fullsc:)
      windows $ W.float win $ W.RationalRect 0 0 1 1
    when (action == remove || (action == toggle && isFull)) $ do
      chWstate $ delete (fi fullsc)
      windows $ W.sink win

  return $ All True

fullscreenEventHook _ = return $ All True


main = do
  host <- fmap nodeName getSystemID
  xmonad $ withUrgencyHook NoUrgencyHook gnomeConfig
    { modMask = mod4Mask
    , focusedBorderColor = (if host == "mkulik" then "#f07746" else "#33aadd")
    , focusFollowsMouse = True
    , layoutHook = myLayout
    , workspaces = myWorkspaces
    , XMonad.terminal = "term"
    , manageHook = myManageHook <+> manageHook gnomeConfig
    , handleEventHook = fullscreenEventHook
    }
    `additionalKeysP` myKeys
    `additionalKeys` myKeys2
