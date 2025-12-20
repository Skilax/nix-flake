{ pkgs
, ...
}:
{
    programs = {
    niri = {
      enable = true;
      };
    };
  #     xdg.portal = {
  #   enable = true;
  #   config = {
  #     common = {
  #       default = [
  #         "wlr"
  #         "gtk"
  #       ];
  #       "org.freedesktop.impl.portal.Access" = [
  #         "gtk"
  #       ];
  #       "org.freedesktop.impl.portal.Notification" = [
  #         "gtk"
  #       ];
  #       "org.freedesktop.impl.portal.Secret" = [
  #         "gnome-keyring"
  #       ];
  #     };
  #   };
  #   extraPortals = with pkgs; [
  #     xdg-desktop-portal-gtk
  #     xdg-desktop-portal-wlr
  #   ];
  # };

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

  environment.systemPackages = with pkgs.gnomeExtensions; [
      dock-from-dash
      #arcmenu
      auto-move-windows
      appindicator
      pano
     ];
 
  services = {
  	 xserver.displayManager.gdm.enable = true;
  	 xserver.displayManager.gdm.wayland = true;
  	 xserver.desktopManager.gnome.enable = true;

     #desktopManager.gnome.enable = true;
     #  displayManager.gdm = {
     #  enable = true;
     #  #wayland = true;
     # };
  };
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
