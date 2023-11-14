{ config, pkgs, ... }:
{
  programs.nixvim = {
    extraConfigLuaPre = ''
      local lsp_kind_icon = {
        Text = "󰉿 ",
        Method = "󰆧 ",
        Function = "󰊕 ",
        Constructor = " ",
        Field = " ",
        Variable = "󰀫 ",
        Class = " ",
        Interface = " ",
        Module = " ",
        Property = " ",
        Unit = " ",
        Value = "󰎠 ",
        Enum = " ",
        Keyword = "󰌋 ",
        Snippet = " ",
        Color = "󰏘 ",
        File = "󰈙 ",
        Reference = "󰈇 ",
        Folder = "󰉋 ",
        EnumMember = " ",
        Constant = "󰏿 ",
        Struct = " ",
        Event = " ",
        Operator = "󰆕 ",
        TypeParameter = " ",
      }
    '';
  };
}
