import XMonad

import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Util.Ungrab
import XMonad.Layout.ThreeColumns
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.DynamicLog (xmobar)
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Actions.UpdatePointer (updatePointer)
import XMonad.Util.Run

myConf = def {
            terminal = "alacritty"
            , layoutHook = ThreeColMid 1 (3/100) (1/2)
            , borderWidth = 2
            , modMask = mod4Mask
            }


main = do
    xmonad =<< xmobar (ewmh . ewmhFullscreen $ myConf)
