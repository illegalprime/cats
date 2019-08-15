{ config, pkgs, ... }:
{
  systemd.services.cats-scraper = {
    enable = true;
    description = "Cat Image Scraper";

    path = with pkgs; [ wget ];

    requires = ["network-online.target"];
    after = ["network-online.service"];

    serviceConfig = {
      Type = "oneshot";
    };

    script = ''
      mkdir -p /images
      ${pkgs.python3}/bin/python ${../scraper/scrape.py}
    '';
  };

  systemd.timers.cats-scraper = {
    enable = true;
    description = "Run Cats Scraper Hourly";

    wantedBy = ["multi-user.target"];

    timerConfig = {
      OnActiveSec = "1h";
    };
  };
}
