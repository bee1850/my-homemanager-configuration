{ config, pkgs, ... }:
{
  programs.nixvim = {
    opts = {
      number = true;
      relativenumber = true;
      spell = false; # Has issues with CHADtree
      spelllang = [ "de" "en" ];
    };
    extraConfigVim = "let skip_defaults_vim=1\nset viminfo=\"\"";
    enableMan = true;
  };
}
