{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.programs.my-alacritty;

in
{

  options = {
    programs.my-alacritty = {
      enable = lib.mkEnableOption "Enable my personal alacritty Configuration";
    };
  };

  imports = [ ./config/alacritty.nix ];

  config = lib.mkIf cfg.enable {

    programs.alacritty = {
      enable = true;
    };

  };
}


