{ config, pkgs, lib, ... }:

{
  config = lib.mkIf config.ventureos.bundles.games.enable {
    home.packages = with pkgs; [
      prismlauncher
      protonup-ng
      eden
      osu-lazer-bin
      heroic
      itch
      srb2
    ];
  };
}
