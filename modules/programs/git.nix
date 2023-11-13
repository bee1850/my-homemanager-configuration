{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.programs.my-git;

in
{

  options = {
    programs.my-git = {
      enable = lib.mkEnableOption "Enable my personal git Configuration";
    };
  };

  config = lib.mkIf cfg.enable {

    programs.git = {
      enable = true;
      userEmail = "bee1850@thi.de";
      userName = "Berkan E.";
      lfs.enable = true;
      extraConfig = {
        safe = {
          directory = "/etc/nixos";
        };
      };
    };

  };
}





