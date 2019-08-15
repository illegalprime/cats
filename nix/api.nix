{ config, pkgs, ... }:
{
  systemd.services.cats-api = {
    enable = true;
    description = "Cats API";
    wantedBy = ["multi-user.target"];
    requires = ["network-online.target"];
    after = ["network-online.service"];

    script = ''
      mkdir -p /images
      FLASK_APP="${../api/api.py}" \
        ${pkgs.python3Packages.flask}/bin/flask \
        run \
        --host=0.0.0.0
    '';
  };

  networking.firewall.allowedTCPPorts = [ 5000 ];
}
