{ config, pkgs, lib, ... }:

{
  config = lib.mkIf config.ventureos.bundles.tex.enable {
    home.packages = with pkgs; [
      texstudio

      (texliveMedium.withPackages (
        ps: with ps; [
          hyperref
          amsmath
          collection-langitalian
          collection-mathscience
        ]
      ))
    ];
  };
}
