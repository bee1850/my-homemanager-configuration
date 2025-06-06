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


  config = lib.mkIf cfg.enable {

    home.file.".config/alacritty/alacritty.toml".source = ./config/alacritty/alacritty.toml;

    programs.alacritty = {
      enable = true;
    };

  };
}


