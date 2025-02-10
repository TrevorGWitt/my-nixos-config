{ config, pkgs, userSettings, ... }:

{
  home.packages = [ pkgs.git ];
  programs.git.enable = true;
  programs.git.userName = "Trevor Witt";
  programs.git.userEmail = "tgwitt99@yahoo.com";
  programs.git.extraConfig = {
    init.defaultBranch = "main";
  };
}
