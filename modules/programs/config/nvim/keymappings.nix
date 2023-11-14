{ config, pkgs, ... }:
{
  programs.nixvim = {

    keymaps = [
      {
        key = "<c-n>";
        mode = [ "n" ];
        action = ":CHADopen<cr>";
        options.desc = "Opens ChadTree";
      }
      {
        key = "<c-l>";
        action = "<c-w>l";
        options.desc = "Move to right window";
      }
      {
        key = "<c-h>";
        action = "<c-w>h";
        options.desc = "Move to left window";
      }
      {
        key = "<c-j>";
        action = "<c-w>j";
        options.desc = "Move to below window";
      }
      {
        key = "<c-k>";
        action = "<c-w>k";
        options.desc = "Move to above window";
      }

    ];

  };
}
