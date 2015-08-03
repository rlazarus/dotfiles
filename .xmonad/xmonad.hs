import XMonad
import XMonad.Config.Gnome
import XMonad.Util.EZConfig
import XMonad.Hooks.EwmhDesktops -- To get Chrome full-screen
import XMonad.Hooks.ManageDocks
import XMonad.Layout.NoBorders

main = xmonad $ gnomeConfig
    { modMask = mod4Mask
    --, manageHook = myManageHook
    , handleEventHook = fullscreenEventHook -- For Chrome
    , layoutHook = smartBorders $ layoutHook gnomeConfig
--    , layoutHook = noBorders $ layoutHook gnomeConfig
    , manageHook = manageDocks <+> myFloatHook
    }
    `additionalKeysP`
    [ ("M-p", spawn "dmenu_run") -- Replace gnome's launcher
    , ("M-c", spawn "google-chrome")
    , ("M-v", spawn "gvim")
    , ("M-`", spawn "nautilus -w")
    ]

-- Temporary: for development
--myManageHook :: ManageHook
--myManageHook = composeAll
                --[ manageHook gnomeConfig
                --, className =? "Qttest.py" --> doFloat
                --]

myFloatHook = composeAll
    [ appName =? "crx_nckgahadagoaajjgafhacjanaoiihapd" --> doFloat -- Chrome Hangouts extension
    , appName =? "zenity" --> doFloat
    , appName =? "Update-manager" --> doFloat
    , appName =? "Update-notifier" --> doFloat
    ]
