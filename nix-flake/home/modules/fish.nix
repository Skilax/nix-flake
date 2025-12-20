{ config, pkgs, ... }:
{
  programs.fish = {
  enable = true;
  shellAliases = {
  ff = "fastfetch";
  };
# Set interactive shell init parameters.
  interactiveShellInit = ''
  set fish_greeting
  '';
  };
}