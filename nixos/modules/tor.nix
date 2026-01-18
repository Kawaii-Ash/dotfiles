{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ tor-browser ];

  services.tor = {
    enable = true;
    client.enable = true;
  };
}
