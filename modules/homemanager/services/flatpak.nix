{ pkgs, lib, config, ...  }: # lib exposes useful opts like lib.mkIf, config lets you manipulate config in this file
{
  options = {
    flatpak.enable =
  	  lib.mkEnableOption "enables flatpak homemanager module";
  };
  config = lib.mkIf config.flatpak.enable {
    services.flatpak.enable = true;
    services.flatpak.remotes = lib.mkOptionDefault [{
      name = "flathub-beta";
      location = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
    }];
    services.flatpak.packages = [
        { appId = "org.openmw.OpenMW"; origin = "flathub-beta";  }
        "com.obsproject.Studio"
        #"org.wezfurlong.wezterm"
        "io.github.limo_app.limo"
        "info.febvre.Komikku"
        "com.bitwarden.desktop"
        "com.calibre_ebook.calibre"
        "com.discordapp.Discord"
        "com.github.ADBeveridge.Raider"
        "com.github.Matoking.protontricks"
        "com.github.mtkennerly.ludusavi"
        "com.spotify.Client"
        "com.stremio.Stremio"
        "io.github.dvlv.boxbuddyrs"
        "io.github.flattool.Warehouse"
        "io.github.loot.loot"
        "io.github.peazip.PeaZip"
        "io.itch.itch"
        "md.obsidian.Obsidian"
        "net.davidotek.pupgui2"
        "net.epson.epsonscan2"
        "org.audacityteam.Audacity"
        "org.beeref.BeeRef"
        "org.gustavoperedo.FontDownloader"
        "org.kde.krita"
        "org.telegram.desktop"
        "dev.pulsar_edit.Pulsar"
      ];
    services.flatpak.overrides = {
    	#"org.wezfurlong.wezterm".Context.devices = ["!dri"];
    };
    services.flatpak.update.onActivation = true;
    services.flatpak.uninstallUnmanaged = true;
  };
}
