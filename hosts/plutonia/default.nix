{
  lib,
  pkgs,
  home-manager,
  username,
  hostname,
  stateVersion,
  ...
}:
{
  imports = [
    # Hardware configuration
    ./hardware-configuration.nix

    # System modules
    ../../modules/nixos/system/nix.nix
    ../../modules/nixos/system/boot.nix
    ../../modules/nixos/system/locale.nix
    ../../modules/nixos/system/package.nix
    ../../modules/nixos/system/power.nix
    ../../modules/nixos/system/security.nix

    # Hardware modules
    ../../modules/nixos/hardware/intel.nix
    ../../modules/nixos/hardware/nvidia.nix
    ../../modules/nixos/hardware/bluetooth.nix

    # Service modules
    ../../modules/nixos/services/network-manager.nix
    ../../modules/nixos/services/dnscrypt-proxy.nix
    ../../modules/nixos/services/docker.nix
    ../../modules/nixos/services/greetd.nix
    ../../modules/nixos/services/pipewire.nix
    ../../modules/nixos/services/xdg.nix

    # Program modules
    ../../modules/nixos/programs/dconf.nix
    ../../modules/nixos/programs/gamemode.nix
    ../../modules/nixos/programs/steam.nix

    # Home manager
    home-manager.nixosModules.home-manager
  ];

  # Allow unfree packages (required by nvidia driver)
  nixpkgs.config.allowUnfree = lib.mkForce true;

  networking.hostName = hostname;

  services.xserver.videoDrivers = [
    "modesetting"
    "nvidia"
  ];

  users.users.${username} = {
    isNormalUser = true;
    shell = pkgs.bash;
    home = "/home/${username}";
    extraGroups = [
      "input"
      "video"
      "wheel"
    ];
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    extraSpecialArgs = { inherit pkgs username stateVersion; };
    users.${username} = import ../../modules/home-manager/user;
  };

  system.stateVersion = stateVersion;
}
