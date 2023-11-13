{ config, pkgs, ... }:
{
  programs.nixvim = {
    options = {
      number = true;
      relativenumber = true;
      spell = true;
      spelllang = [ "de" "en" ];
    };
    extraConfigVim = "let skip_defaults_vim=1\nset viminfo=\"\"";
    enableMan = true;
  };
}
