{ pkgs
, ...
}:
{ 
  services = {
    #displayManager.ly.package = pkgs.ly;
    #displayManager.ly.enable = true;
    ratbagd.enable = true; # For piper
    watchdogd.enable = false; # Disable watchdog
    };
}
