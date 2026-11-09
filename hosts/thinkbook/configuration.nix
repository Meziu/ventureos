{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/options.nix
    ../../modules/desktop-defaults.nix
    ../../modules/intel-graphics-drivers.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.efiSysMountPoint = "/boot";
  boot.loader.systemd-boot.configurationLimit = 5;

  networking.hostName = "nixos-thinkbook";
}
