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

  config = lib.mkIf cfg.enable {

    imports = [ 
      ./config/nvim/autocmd.nix
      ./config/nvim/colorscheme.nix
      ./config/nvim/plugins.nix
      ./config/nvim/settings.nix
    ];

    programs = {
        nixvim.enable = true;
        zsh = {
           shellAliases.vim = "nvim";
            environmentVariables.EDITOR = "nvim";
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



