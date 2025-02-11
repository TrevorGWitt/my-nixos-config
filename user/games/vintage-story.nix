{ config, pkgs, pkgs-unstable, userSettings, ... }:

{
  home.packages = [ pkgs-unstable.vintagestory ];
}
