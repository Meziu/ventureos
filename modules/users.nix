{ config, ... }:

{
  users.users.${config.ventureos.user.name} = {
    isNormalUser = true;
    description = "${config.ventureos.user.description}";
    extraGroups = [
      "networkmanager"
      "wheel"
      "libvirtd"
    ];
  };
}
