{ config, ... }:
{
  nixpkgs.overlays = [
    (final: prev: {
      oreo-cursors-plus = prev.oreo-cursors-plus.override {
        cursorsConf = ''
          puppet_red = #d13435
        '';
      };
    })
  ];
}
