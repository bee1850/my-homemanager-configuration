{ config, pkgs, ... }:
{
  # Dont forget to add a autocmd if needed! 

  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      servers = {
        clangd.enable = true;
        bashls.enable = true;
        eslint.enable = true;
        nil_ls.enable = true;
        terraformls.enable = true;
      };
    };
  };
}
