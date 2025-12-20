{ config
, pkgs
, lib
, ... 
}:
{
  hardware.opentabletdriver.enable = true; 
  hardware.opentabletdriver.daemon.enable = true;
}