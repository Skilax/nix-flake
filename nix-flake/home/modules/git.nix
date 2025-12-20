{ ... }:
{
  programs = {
    git = {
      enable = true;
      userName = "Skilax";
      userEmail = "235319533+Skilax@users.noreply.github.com";
      extraConfig = {
        color.ui = true;
        init.defaultBranch = "master";
        credential.helper = "store";
        core.fscache = false;
      };
    };
  };
}
