{ curversion, ... }: 
{
  imports = [
    ./software.nix
    ./modules
  ];

  home = {
    stateVersion = "${curversion}";
    username = "lagavulin";
    homeDirectory = "/home/lagavulin";
    sessionVariables = {
    };
  };
}