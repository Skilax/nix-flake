{ pkgs
, ...
}:
{
  programs.virt-manager.enable = true;
  virtualisation.waydroid.package = pkgs.waydroid;
  virtualisation.waydroid.enable = true;
  virtualisation.libvirtd.enable = true;
}