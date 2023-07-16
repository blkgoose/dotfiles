import XMonad

import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Util.Ungrab
import XMonad.Layout.ThreeColumns
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP

main = xmonad $ ewmhFullscreen . ewmh . xmobarProp $ myConfig

myConfig = def
    { terminal = "alacritty"
    , layoutHook = myLayout
    , borderWidth = 3
    , modMask = mod4Mask
    }

myLayout = ThreeColMid 1 (3/100) (1/2)
