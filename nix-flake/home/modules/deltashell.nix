{ config, pkgs, inputs, ... }: 



let
  # Shortcuts for astal/ags packages
  astalPkgs = inputs.astal.packages.${pkgs.system};
  astalNiriPkgs = inputs.astal_niri.packages.${pkgs.system};
  agsPkgs = inputs.ags.packages.${pkgs.system};
in
{
  home.packages = with pkgs; [
    gjs
    gtk4
    brightnessctl
    dart-sass
    gpu-screen-recorder
    cliphist
    bluez
    libsoup_3
    libadwaita
    gobject-introspection
    geoclue2
    glib-networking
  ]
  ++ [ 
    astalPkgs.io
    astalPkgs.astal4
    astalPkgs.apps
    astalPkgs.hyprland
    astalPkgs.battery
    astalPkgs.bluetooth
    astalPkgs.mpris
    astalPkgs.network
    astalPkgs.notifd
    astalPkgs.powerprofiles
    astalPkgs.tray
    astalPkgs.wireplumber
  ]
  ++ [
    astalNiriPkgs.niri
    agsPkgs.agsFull
  ];

}
