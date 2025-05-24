{ pkgs, lib, config, ...  }: # lib exposes useful opts like lib.mkIf, config lets you manipulate config in this file
{
  options = {
    plasmacfg.enable =
  	  lib.mkEnableOption "enables plasmacfg module";
  };
  config = lib.mkIf config.plasmacfg.enable {
    #added for steam not using cursor theme
    home.file.".icons/default".source = "${pkgs.kdePackages.breeze}/share/icons/breeze_cursors";
    programs.plasma = {
        enable = true;
        workspace = {
        lookAndFeel = "org.kde.breezedark.desktop";
        iconTheme = "Tela-purple-dark";
        };
        hotkeys.commands."launch-wezterm" = {
        name = "Launch wezterm";
        key = "Meta+Alt+T";
        command = "wezterm";
        };
        desktop.widgets = [
        {
            name = "org.kde.plasma.weather";
            position = {
            horizontal = 900;
            vertical = 20;
            };
            size = {
            width = 310;
            height = 220;
            };
            config = {
            WeatherStation = {
                source = "bbcukmet|weather|Singapore, Singapore, SG|1880252";
            };
            };
        }
        ];
        panels = [
        #always visible important stuff at top
        {
            location = "top";
            height = 22;
            widgets = [
            {
                kickoff = {
                sortAlphabetically = true;
                icon = "nix-snowflake-white";
                };
            }
            "org.kde.plasma.marginsseparator"
            "org.kde.plasma.panelspacer"
            {
                digitalClock = {
                date = {
                    enable = true;
                    format = "isoDate";
                    position = "besideTime";
                };
                time = {
                    showSeconds = "always";
                    format = "24h";
                };
                };
            }
            "org.kde.plasma.panelspacer"
            "org.kde.plasma.marginsseparator"
            {
                systemTray = {
                items = {
                    shown = [
                    "org.kde.plasma.battery"
                    "org.kde.plasma.blueooth"
                    ];
                };
                };
            }
            "org.kde.plasma.showdesktop"
            ];
        }
        #app icon bar at the bottom of screen
        {
            location = "bottom";
            height = 44;
            floating = true;
            hiding = "autohide";
            widgets = [
            "org.kde.plasma.panelspacer"
            {
                iconTasks = {
                launchers = [
                    "applications:systemsettings.desktop"
                    "applications:org.kde.discover.desktop"
                    "applications:org.kde.dolphin.desktop"
                    "applications:org.wezfurlong.wezterm.desktop"
                    "applications:firefox.desktop"
                    "applications:startcenter.desktop"
                    "applications:thunderbird.desktop"
                    "applications:com.spotify.Client.desktop"
                    "applications:org.kde.krita.desktop"
                ];
                };
            }
            "org.kde.plasma.panelspacer"
            ];
        }
        ];
    };
  };
}
