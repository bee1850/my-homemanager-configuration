{ config, pkgs, ... }:
{
  programs.nixvim = {
    options = {
      number = true;
      relativenumber = true;
      spell = true;
      spellang = [ "de" "en" ];
      enableMan = true;
      extraConfigVim = "let skip_defaults_vim=1\nset viminfo=\"\"";
    };
  };
}
