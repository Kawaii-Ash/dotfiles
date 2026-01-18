{
  config,
  pkgs,
  lib,
  ...
}:
{
  xdg.mime.defaultApplications = {
    "inode/directory" = "nnn.desktop";
    "application/x-directory" = "nnn.desktop";
  };

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-termfilechooser
    ];
    config.niri = {
      "org.freedesktop.impl.portal.FileChooser" = "termfilechooser";
    };
  };
}
