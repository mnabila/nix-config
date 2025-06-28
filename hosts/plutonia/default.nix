{ home-manager, pkgs, ... }:

let
  username = "saya";
  hostname = "plutonia";
  stateVersion = "25.05";
in
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

    # Service modules
    ../../modules/nixos/services/connman.nix
    ../../modules/nixos/services/dnscrypt-proxy.nix
    ../../modules/nixos/services/docker.nix
    ../../modules/nixos/services/greetd.nix
    ../../modules/nixos/services/pipewire.nix
    ../../modules/nixos/services/security.nix
    ../../modules/nixos/services/xdg.nix

    # Program modules
    ../../modules/nixos/programs/dconf.nix
    ../../modules/nixos/programs/gamemode.nix
    ../../modules/nixos/programs/gamescope.nix

    # Home manager
    home-manager.nixosModules.home-manager
  ];

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
      "docker"
      "input"
      "libvirtd"
      "networkmanager"
      "video"
      "wheel"
    ];
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    users.${username} = import ../../modules/home-manager/user {
      inherit pkgs username stateVersion;
    };
  };

  system.stateVersion = stateVersion;
}
