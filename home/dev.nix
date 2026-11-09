{ config, pkgs, lib, ... }:

let
  custom-r-studio = pkgs.rstudioWrapper.override {
    packages = with pkgs.rPackages; [ scatterplot3d corrplot ggplot2 dplyr xts ];
  };
in
{
  config = lib.mkIf config.ventureos.bundles.dev.enable {
    home.packages =
    (with pkgs; [
      nil
      nixfmt
      rustup
      pkg-config
      gcc
      swi-prolog
      haskellPackages.ghc
      haskellPackages.cabal-install

      custom-r-studio

      # Utilities
      perf
      graphviz
    ])
    ++ (with pkgs.python314Packages; [
      python
      numpy
      matplotlib
      pillow
      scikit-learn
      scipy
      torch
    ]);

    home.sessionVariables.JAVA_TOOL_OPTIONS = lib.concatStringsSep " " [
      "-Dawt.useSystemAAFontSettings=on"
      "-Dswing.aatext=true"
      "-Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel"
    ];
  };
}
