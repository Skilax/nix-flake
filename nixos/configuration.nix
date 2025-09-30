{ config
, pkgs
, curversion
, ... 
}:

{
  imports = [
    ./hardware-configuration.nix
    ./packages.nix
    ./modules/subsystem
    ./modules/system
  ];

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      warn-dirty = false;
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  networking.hostName = "eenymeenyminymoe"; # Define your hostname.
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Moscow";
  i18n.defaultLocale = "en_US.UTF-8";

  services = {
    dbus.enable = true;
    gvfs.enable = true;
    resolved.enable = true; # needed for nekotay tun mode correct work
    xserver = {
  		enable = true;
      xkb.layout = "us,ru";
      xkb.variant = "";
      excludePackages = [ pkgs.xterm ];
    };
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  programs = {
    dconf.enable = true;
    gpu-screen-recorder.enable = true; 
    firefox.enable = true;
  };
  system.stateVersion = "${curversion}"; # Did you read the comment?
}