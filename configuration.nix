{ config, pkgs, ... }:

let
  unstable =  import <unstable> {};
in

{
  imports =
    [
      ./hardware-configuration.nix     # My machine hardware config
      ./modules/UI.nix                 # My UI settings
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;
 
  # General
  networking.hostName = "NixOs";
  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;
  time.timeZone = "Africa/Nairobi";
  i18n.defaultLocale = "en_US.UTF-8";
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # My User
  users.users.phate = {
    isNormalUser = true;
    description = "phate";
    extraGroups = [ "networkmanager" "wheel" "podman"];
    packages = with pkgs; [];
  };

  # Unfree packages
  nixpkgs.config.allowUnfree = true;

  # System wide package install
  environment.systemPackages = [
    pkgs.kitty                   # terminal
    pkgs.neovim                  # texteditor
    pkgs.firefox                 # browser
    pkgs.wget
    pkgs.tree
    pkgs.btop                    # system resource monitoring
    pkgs.git                     # version control
    pkgs.gh                      # github
    pkgs.podman                  # Podman
    pkgs.podman-compose
    pkgs.nix-ld                  # app support
    pkgs.fail2ban                # handle brute force attacks

    pkgs.localsend               # file sharing
    pkgs.obsidian                # .md notes
    pkgs.freecad                 # 3D-CAD

    unstable.go                  # golang
  ];

  # Neovim (for now)
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
  
  # Podman
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;            # enables Docker CLI compatibility
    dockerSocket.enable = true;     # enables Docker API compatibility
  };
  
 # SSH
  services.openssh = {
    enable = true;
    ports = [ 213 ];
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = true;
    };
  };

  # Firewall.
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      213    # ssh local
    ];
  };

  # Security
  services.fail2ban.enable = true;

  # Package support
  programs.nix-ld.enable = true;
  
  # Garbage collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
  };
  nix.optimise.automatic = true;

  system.stateVersion = "24.11";

}
