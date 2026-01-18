{ config, pkgs, ... }:
{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      ignoreUserConfig = true;
      addons = with pkgs; [
        fcitx5-mozc
        fcitx5-gtk
        fcitx5-tokyonight
      ];
      settings = {
        globalOptions = {
          "Hotkey" = {
            "EnumerateSkipFirst" = false;
          };
          "Hotkey/TriggerKeys" = {
            "0" = "Super+Alt+space";
          };
          "Behavior" = {
            "DefaultPageSize" = 5;
          };
        };
        inputMethod = {
          "Groups/0" = {
            Name = "Default";
            "Default Layout" = "gb";
            DefaultIM = "keyboard-gb";
          };
          "Groups/0/Items/0".Name = "keyboard-gb";
          "Groups/0/Items/1".Name = "mozc";
        };
        addons.classicui.globalSection = {
          "Theme" = "Tokyonight-Storm";
          "DarkTheme" = "Tokyonight-Storm";
        };
      };
    };
  };

  # Starts fcitx5 automatically
  services.xserver.desktopManager.runXdgAutostartIfNone = true;
}
