{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.programs.my-nvim;

in
{

  options = {
    programs.my-nvim = {
      enable = lib.mkEnableOption "Enable my personal nvim Configuration";
    };
  };

  imports = [
    ./config/nvim/autocmd.nix
    ./config/nvim/colorscheme.nix
    ./config/nvim/plugins.nix
    ./config/nvim/settings.nix
  ];

  config = lib.mkIf cfg.enable {

    programs = {
      nixvim.enable = true;
      zsh = {
        shellAliases.vim = "nvim";
        sessionVariables.EDITOR = "nvim";
      };
    };

    home = {
      sessionVariables = {
        EDITOR = "nvim";
      };
      shellAliases = {
        vim = "nvim";
      };
    };

  };
}



