{ config, pkgs, userSettings, ... }:

{
  home.packages = [ pkgs.git ];
  programs.git = {
    enable = true;
    userName = "Trevor Witt";
    userEmail = "tgwitt99@yahoo.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
