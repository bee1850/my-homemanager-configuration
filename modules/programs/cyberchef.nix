{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.programs.cyberchef;

in
{

  options = {
    programs.cyberchef = {
      enable = lib.mkEnableOption "Cyberchef - IT-Security Swiss Army Knife";
    };
  };

  config = lib.mkIf cfg.enable {

    home.packages = [ pkgs.cyberchef ];

    programs.zsh.shellAliases = {
      cyberchef = "firefox ~/.nix-profile/share/cyberchef/index.html > /dev/null 2>&1 & ";
    };

  };
}


