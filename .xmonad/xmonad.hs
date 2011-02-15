import XMonad
import XMonad.Config.Gnome
import XMonad.Config.Desktop
import XMonad.Util.EZConfig
import XMonad.Layout.NoBorders
import XMonad.Layout.PerWorkspace
import XMonad.Layout.IM
import XMonad.Layout.Grid
import XMonad.Actions.WindowGo
import XMonad.Actions.CycleWS
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.ManageHelpers
import Data.List
import Data.Ratio ((%))
import Control.Monad (liftM2)
import qualified XMonad.StackSet as W

{- curLayout :: X String-}
{- curLayout = gets windowset >>= return . description . W.layout . W.workspace . W.current-}

myWorkspaces = ["1", "2", "3", "4", "5"]

myLayout = desktopLayoutModifiers
           $ smartBorders
           $ onWorkspace "2" (Tall 1 0.1 0.66 ||| Mirror(Tall 1 0.1 0.66) ||| Full)
           $ onWorkspace "4" imLayout
           $ baseLayout
  where
    baseLayout = Full ||| Tall 1 0.1 0.66 ||| Mirror(Tall 1 0.1 0.66)
    roster = Or (And (Role "contact_list") (ClassName "Empathy")) (And (ClassName "Gajim.py") (Role "roster"))
    imLayout = withIM (1%6) roster Grid

myKeys =
    [ ("M-<Left>",    prevWS )
    , ("M-<Right>",   nextWS )
    , ("M-e", runOrRaiseNext "e" (className =? "Gvim"))
    , ("M-w", runOrRaiseNext "google-chrome" (className =? "Google-chrome" <||> className =? "Chromium"))
    , ("M-c", runOrRaiseNext "gnome-terminal" (className =? "Gnome-terminal"))
    , ("M-S-r", spawn "xmonad --recompile; xmonad --restart")
    , ("M-q", kill)
    , ("M-u", focusUrgent)
    {- , ("M-<Space>", sendMessage NextLayout >> (curLayout >>= \d->spawn $"notify-send "++d))-}
    , ("M-C-j", prevScreen)
    , ("M-C-k", nextScreen)
    , ("M-C-o", shiftNextScreen)
    ]

myManageHook = composeAll . concat $
   [ [ isDialog --> doCenterFloat ]
   , [ className =? "Gvim" --> viewShift "3" ]
   {- , [ className =? "Gajim.py"    --> doShift "jabber" ]-}
   {- , [(className =? "Google-chrome" <&&> resource =? "Dialog") --> doFloat]-}
     -- using list comprehensions and partial matches
   , [ className =? c --> doFloat | c <- myFloatsC ]
   , [ title =? t --> doFloat | t <- myFloatsT ]
   , [ fmap ( c `isInfixOf`) className --> doFloat | c <- myMatchAnywhereFloatsC ]
   , [ fmap ( c `isInfixOf`) title     --> doFloat | c <- myMatchAnywhereFloatsT ]
   ]
   -- in a composeAll hook, you'd use: fmap ("VLC" `isInfixOf`) title --> doFloat
  where myFloatsC = ["MPlayer", "Xmessage", "Gimp"]
        myFloatsT = ["Google Chrome Preferences"]
        myMatchAnywhereFloatsC = []
        myMatchAnywhereFloatsT = ["VLC"]
        viewShift = doF . liftM2 (.) W.greedyView W.shift

main = do
  xmonad $ withUrgencyHook NoUrgencyHook gnomeConfig
    { modMask = mod4Mask
    , focusedBorderColor = "#f07746"
    , focusFollowsMouse = False
    , layoutHook = myLayout
    , workspaces = myWorkspaces
    , manageHook = myManageHook <+> manageHook gnomeConfig
    {- , logHook = dynamicLog-}
    }
    `additionalKeysP` myKeys
