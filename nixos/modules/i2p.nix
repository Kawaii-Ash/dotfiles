{ config, ... }:
{
  services.i2pd = {
    enable = true;
    proto = {
      httpProxy.enable = true;
      http.enable = true;
    };
    outTunnels = {
      "IRC" = {
        enable = true;
        destination = "irc.echelon.i2p";
        destinationPort = 6667;
        address = "127.0.0.1";
        port = 6668;
      };
    };
  };
}
