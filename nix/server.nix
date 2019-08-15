{
  network.description = "scraper service";

  server = { config, pkgs, ... }: {
    imports = [
      ./api.nix
      ./scraper.nix
    ];
  };
}
