{
  pkgs,
  lib,
  config,
  ...
}:
# lib exposes useful opts like lib.mkIf, config lets you manipulate config in this file
{
  options = {
    flatpak.enable =
      lib.mkEnableOption "enables flatpak homemanager module";
  };
  config = lib.mkIf config.flatpak.enable {
    services.flatpak.enable = true;
    services.flatpak.remotes = lib.mkOptionDefault [
      {
        name = "flathub-beta";
        location = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
      }
    ];
    services.flatpak.packages = [
      {
        appId = "org.openmw.OpenMW";
        origin = "flathub-beta";
      }
      "com.obsproject.Studio"
      #"org.wezfurlong.wezterm"
      "io.github.limo_app.limo"
      "info.febvre.Komikku"
      # "com.bitwarden.desktop"
      "com.calibre_ebook.calibre"
      "com.github.ADBeveridge.Raider"
      # "com.github.Matoking.protontricks"
      "com.github.mtkennerly.ludusavi"
      "com.spotify.Client"
      "com.stremio.Stremio"
      "io.github.dvlv.boxbuddyrs"
      "io.github.flattool.Warehouse"
      "io.github.loot.loot"
      # "io.github.peazip.PeaZip"
      "io.itch.itch"
      # "net.davidotek.pupgui2"
      "org.audacityteam.Audacity"
      "org.beeref.BeeRef"
      "org.gustavoperedo.FontDownloader"
      # "org.kde.krita"
      "org.telegram.desktop"
      "dev.pulsar_edit.Pulsar"
      "io.github.MakovWait.Godots"
      # "com.heroicgameslauncher.hgl"
      "com.discordapp.Discord"
      "com.unity.UnityHub"
      "io.github.achetagames.epic_asset_manager"
      "org.onlyoffice.desktopeditors"
      "re.sonny.Eloquent" # dedicated proofreading app(at least for English and Mandarin)!
      "net.pixieditor.PixiEditor"
      # "org.gimp.GIMP"
      # "org.gimp.GIMP.Plugin.Resynthesizer"
      # "org.gimp.GIMP.Plugin.LiquidRescale"
      # "org.gimp.GIMP.Plugin.BIMP"
      # "org.gimp.GIMP.GMic"
      # "org.gimp.GIMP.Plugins.Fourier"
      # "org.gimp.GIMP.Plugins.Lensfun"
      "org.jousse.vincent.Pomodorolm"
    ];
    services.flatpak.overrides = {
      #"org.wezfurlong.wezterm".Context.devices = ["!dri"];
      "com.spotify.Client".Context = {
        filesystems = [ 
          "/mnt/Lexar_SSD/Music_Secondary/Spotify_Storage:rw"
        ];
      };
      "io.github.limo_app.limo".Context = {
        filesystems = [
          "~/.var/app/org.openmw.OpenMW/config:rw"
        ];
      };
    };
    services.flatpak.update.onActivation = true;
    services.flatpak.uninstallUnmanaged = true;
  };
}
