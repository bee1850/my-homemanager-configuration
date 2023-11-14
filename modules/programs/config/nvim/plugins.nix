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
        tsserver.enable = true;
        tsserver.extraOptions = {
          init_options = {
            preferences = {
              disableSuggestions = true;
            };
          };
        };
        terraformls.enable = true;
      };
    };
    chadtree.enable = true;
    lightline.enable = true;
  };
}
