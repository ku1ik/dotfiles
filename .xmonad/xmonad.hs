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
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.ManageHelpers
import Data.List
import Data.Ratio ((%))
import Control.Monad (liftM2)
import qualified XMonad.StackSet as W

myWorkspaces = ["1", "2", "3", "4", "5", "6"]

myLayout = desktopLayoutModifiers
           $ smartBorders
           $ toggleLayouts Full
           $ onWorkspace "4" imLayout
           $ baseLayout
  where
    baseLayout = Tall 1 0.1 0.66 ||| Mirror(Tall 1 0.1 0.66)
    jabberRoster = And (Role "contact_list") (ClassName "Empathy")
    skypeRoster = And (Role "MainWindow") (ClassName "Skype")
    imLayout = withIM (0.16) jabberRoster $ reflectHoriz $ withIM (0.2) skypeRoster Grid
    {- imLayout = withIM (1%6) roster Grid-}

myKeys =
    [ ("M-e", runOrRaiseNext "e" (className =? "Gvim"))
    , ("M-w", runOrRaiseNext "google-chrome" (className =? "Google-chrome" <||> className =? "Chromium"))
    , ("M-c", runOrRaiseNext "gnome-terminal" (className =? "Gnome-terminal"))
    , ("M-S-r", spawn "xmonad --recompile; xmonad --restart")
    , ("M-q", kill)
    , ("M-u", focusUrgent)
    , ("M-o", toggleWS)
    {- , ("M-<Space>", sendMessage NextLayout >> (curLayout >>= \d->spawn $"notify-send "++d))-}
    , ("M-C-j", prevScreen)
    , ("M-C-k", nextScreen)
    , ("M-C-o", shiftNextScreen)
    , ("M-S-l", spawn "gnome-screensaver-command -l")
    , ("M-[", moveTo Prev HiddenWS)
    , ("M-]", moveTo Next HiddenWS)
    , ("M-S-[", shiftTo Prev HiddenWS)
    , ("M-S-]", shiftTo Next HiddenWS)
    , ("M-f", sendMessage $ ToggleLayout)
    ]

myManageHook = composeAll . concat $
   [ [ isDialog --> doCenterFloat ]
   , [ isFullscreen --> doFullFloat ]
   , [ className =? "Gvim" --> viewShift "3" ]
   , [ className =? "Empathy" --> viewShift "4" ]
   , [ className =? "Skype" --> viewShift "4" ]
   , [ className =? "Screenkey" --> doF W.focusDown ] {- doIgnore also -}
   , [ appName =? "update-manager" --> doCenterFloat ]
   {- , [ className =? "Gajim.py"    --> doShift "jabber" ]-}
   {- , [(className =? "Google-chrome" <&&> resource =? "Dialog") --> doFloat]-}
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

main = do
  xmonad $ withUrgencyHook NoUrgencyHook gnomeConfig
    { modMask = mod4Mask
    , focusedBorderColor = "#f07746"
    , focusFollowsMouse = True
    , layoutHook = myLayout
    , workspaces = myWorkspaces
    , manageHook = myManageHook <+> manageHook gnomeConfig
    {- , logHook = dynamicLog-}
    }
    `additionalKeysP` myKeys
