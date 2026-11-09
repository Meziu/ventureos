{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/options.nix
    ../../modules/desktop-defaults.nix
  ];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "nixos-vm";

  services.qemuGuest.enable = true;
  services.spice-vdagentd.enable = true;
}
