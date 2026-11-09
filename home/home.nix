{
  config,
  ...
}:

let
  kb = import ../modules/apple-aluminum-keyboard.nix;
in
{
  imports = [
    ../modules/options.nix
    ./hyprland
    ./programs.nix
    ./dev.nix
  ];

  nixpkgs.config.allowUnfree = true;

  home.username = "${config.ventureos.user.name}";
  home.homeDirectory = "/home/${config.home.username}";

  home.keyboard = {
    layout = kb.layout;
    variant = kb.variant;
    options = [ kb.options ]; # home.keyboard.options wants a list
  };

  xdg.enable = true;
  xdg.portal.enable = true;

  home.sessionVariables = {
    EDITOR = "vim";
  };

  home.stateVersion = "${config.ventureos.stateVersion}";
}
