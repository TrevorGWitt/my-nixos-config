{ config, pkgs, pkgs-unstable, userSettings, ... }:

{
  # Onboard is a virtual keyboard for x11
  home.packages = [ pkgs-unstable.onboard ];
}

