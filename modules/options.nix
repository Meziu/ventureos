{ lib, ... }:
{
  options.ventureos = {
    user = {
      name = lib.mkOption {
        type = lib.types.str;
        example = "alice";
        description = "Login name of the primary user.";
      };
      description = lib.mkOption {
        type = lib.types.str;
        example = "Alice Rossi";
        description = "Full name of the user.";
      };
    };

    bundles = {
      games.enable = lib.mkEnableOption "Games bundle";
      tex.enable   = lib.mkEnableOption "LaTeX bundle";
      dev.enable   = lib.mkEnableOption "Development bundle";
    };

    stateVersion = lib.mkOption {
      type = lib.types.str;
      default = "26.05";
      example = "26.05";
      description = "State version of NixOS and nixpkgs.";
    };
  };
}
