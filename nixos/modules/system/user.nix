{ pkgs
, uservars
, ...
}:
{
  programs.fish.enable = true;
  users.users.lagavulin = {
    isNormalUser = true;
    description = "lagavulin";
    extraGroups = [ 
      "networkmanager" 
      "wheel"
      "games"
      "input"
    ];
    shell = pkgs.fish;
    ignoreShellProgramCheck = true;
  };
}