{ pkgs
, ...
}:
{
  environment.gnome.excludePackages = with pkgs; [
    yelp
    geary
    seahorse
    epiphany
    cheese
    simple-scan
    gedit
    totem
    snapshot
    gnome-text-editor
    gnome-photos
    gnome-weather
    gnome-tour
    gnome-contacts
    gnome-logs
    gnome-maps
    gnome-connections
    gnome-characters
    gnome-music
    
  ];

  services = {
    ratbagd.enable = true;
    watchdogd.enable = false;
    desktopManager.gnome.enable = true;
       displayManager.gdm = {
          enable = true;
          wayland = true;
      };
  };
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}